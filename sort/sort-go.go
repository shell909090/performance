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

type Items struct {
	data []Item
}

func (is Items) Len() int {
	return len(is.data)
}

func (is Items) Swap(i, j int) {
	is.data[i], is.data[j] = is.data[j], is.data[i]
}

func (is Items) Less(i, j int) bool {
	return is.data[i].data[1] < is.data[j].data[1]
}

func (is *Items) Append(i Item) {
	is.data = append(is.data, i)
}

func (is *Items) Get(i int) *Item {
	return &(is.data[i])
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
		is.Append(item)
		line, err = stream.ReadString('\n')
	}

	fmt.Println(is.Len())
	sort.Sort(is)
	return
}