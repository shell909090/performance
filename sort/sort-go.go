package main

import (
	"os"
	"fmt"
	"sort"
	"bufio"
	"strings"
	"strconv"
)

type Item struct {
	data [2]int
}

type Items []Item

func (is Items) Len() int {
	return len(is)
}

func (is Items) Swap(i, j int) {
	is[i], is[j] = is[j], is[i]
}

func (is Items) Less(i, j int) bool {
	return is[i].data[1] < is[j].data[1]
}

func main() {
	var is Items
	var item Item

	f, err := os.Open(os.Args[1])
	if err != nil {
		fmt.Println(err)
		return
	}
	defer f.Close()

	stream := bufio.NewReader(f)
	line, err := stream.ReadString('\n')
	for err == nil {
		line = strings.TrimRight(line, "\n")
		fields := strings.Split(line, " ")
		item.data[0], _ = strconv.Atoi(fields[0])
		item.data[1], _ = strconv.Atoi(fields[1])
		is = append(is, item)
		line, err = stream.ReadString('\n')
	}

	sort.Sort(is)
	return
}
