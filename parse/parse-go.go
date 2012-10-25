package main

import (
	"fmt"
	"regexp"
	"os"
	"bufio"
)

func main() {
	f, _ := os.Open("data.txt")
	r := bufio.NewReader(f)

	rex, _ := regexp.Compile("(\\d+) (\\d+)")

	for line, isPrefix, err := r.ReadLine();
	    err == nil && !isPrefix
	    line, isPrefix, err = r.ReadLine() {
		rex.FindSubmatch(line)
	}
}