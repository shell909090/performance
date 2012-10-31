package main

import (
	"os"
	"fmt"
	"flag"
	"time"
	"errors"
	"os/exec"
	"syscall"
)

func runprog(argv []string) (filesize int64, mem int64, err error) {
	var attr os.ProcAttr
	var stat *os.ProcessState
	var proc *os.Process

	exepath, err := exec.LookPath(argv[0])
	if err != nil {
		err = errors.New("can't find exe file.")
		return
	}

	proc, err = os.StartProcess(exepath, argv, &attr)
	if err != nil { return }

	fi, err := os.Stat(exepath)
	if err != nil { return }

	filesize = fi.Size()
	stat, err = proc.Wait()
	mem = int64(stat.SysUsage().(*syscall.Rusage).Maxrss)
	return
}

func average(array *[]int64) int64 {
	var s int64
	for i := 0; i < len(*array); i++ { s += (*array)[i] }
	return int64(float32(s) / float32(len(*array)))
}

func main () {
	var filesize, mem int64
	var mems []int64

	t := flag.Int("t", 1, "run times")
	lang := flag.String("l", "--", "lang")
	flag.Parse()
	if *lang == "--" { lang = &(flag.Args()[0]) }
	start := time.Now()

	for i := 0; i < *t; i++ {
		filesize, mem, _ = runprog(flag.Args())
		mems = append(mems, mem)
	}

	dur := time.Now().Sub(start)
	mem = average(&mems)
	fmt.Printf("lang: %s, filesize: %d kB, runtime: %0.3f s, memory: %d kB\n",
		*lang, filesize / 1024, (dur.Seconds() / float64(*t) + 0.0005), mem)
}