package main

import (
	"os"
	// "fmt"
	"bufio"
	"regexp"
)

func main() {
	f, _ := os.Open("mnt/data.txt")
	r := bufio.NewReader(f)

	rex, _ := regexp.Compile("(\\d+) (\\d+)")

	for line, isPrefix, err := r.ReadLine();
	    err == nil && !isPrefix
	    line, isPrefix, err = r.ReadLine() {
		rex.FindSubmatch(line)
	}
}