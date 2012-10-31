package main

import (
	"fmt"
	"sort"
	"errors"
	"strconv"
)

func setable(numbers []int) (rslt []int) {
	var p, i int
	sort.Ints(numbers)
	for _, i = range numbers {
		if i != p {
			rslt = append(rslt, i)
			p = i
		}
	}
	return
}

func remove(numbers []int, n int) (rslt []int, err error) {
	for i := 0; i < len(numbers); i++ {
		if numbers[i] == n {
			copy(numbers[i:], numbers[i+1:])
			return numbers[:len(numbers)-1], nil
		}
	}
	err = errors.New("element not found")
	return
}

func do_op(op string, value1 float32, value2 float32) (rslt float32, err error) {
	if op == "+" { return value1 + value2, nil }
	if op == "-" { return value1 - value2, nil }
	if op == "*" { return value1 * value2, nil }
	if op == "/" { return value1 / value2, nil }
	return 0, errors.New("unknown ops")
}

func exchangeable(op string) bool {
	if op == "+" || op == "*" { return true }
	return false
}

func iter_all(ops []string, exp string, value float32, numbers []int) (err error) {
	var n int
	var v float32
	var op string

	if len(numbers) == 0 {
		if value == 24 { fmt.Println(exp, "=", value) }
		return
	}
	
	for _, n = range setable(numbers) {
		numbers, _ = remove(numbers, n)
		for _, op = range ops {
			v, err = do_op(op, value, float32(n))
			if err == nil { 
				iter_all(ops,
					strconv.Itoa(n) + op + "(" + exp + ")",
					v, numbers)
			}
			if exchangeable(op) {
				v, err = do_op(op, float32(n), value)
				if err == nil {
					iter_all(ops,
						"(" + exp + ")" + op + strconv.Itoa(n),
						v, numbers)
				}
			}
		}
		numbers = append(numbers, n)
	}
	return 
}

func main() {
	var n int
	var numbers = []int{3,4,5,6,7,8}
	var opts = []string{"+", "-", "*", "/"}
	for _, n = range setable(numbers) {
		numbers, _ = remove(numbers, n)
     		iter_all(opts, strconv.Itoa(n), float32(n), numbers)
		numbers = append(numbers, n)
	}
}
