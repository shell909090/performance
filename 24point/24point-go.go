package main

import (
	"fmt";
	"sort";
	"errors";
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

func do_op(op string, value1 float32, value2 float32) (rslt float32, err error) {
     if op == "+" { return value1 + value2, nil }
     if op == "-" { return value1 - value2, nil }
     if op == "*" { return value1 * value2, nil }
     if op == "/" { return value1 / value2, nil }
     return 0, errors.New("unknown ops")
}

func iter_all(ops []string, exp string, value float32, numbers []int) (err error) {
	var n, i int
	var v float32
	var op string
	var ns []int

	if len(numbers) == 0 {
		if value == 24 { fmt.Println(exp, "=", value) }
		return
	}
	
	// TODO:
	for _, n = range numbers {
		ns = ns[:0]
		flag := false
		for _, i = range numbers {
			if i != n || flag{
				ns = append(ns, i)
			}else{
				flag = true
			}
		}
		if exp == "" {
			iter_all(ops, strconv.Itoa(n), float32(n), ns)
		}else{
			for _, op = range ops {
			    v, err = do_op(op, value, float32(n))
			    if err != nil {
			       return
			    }
			    iter_all(ops,
				strconv.Itoa(n) + op + "(" + exp + ")",
				v, ns)
			}
		}
	}
	return 
}

func main() {
     for i := 0; i < 100; i++ {
     	 iter_all([]string{"+", "-", "*", "/"}, "", 0, []int{3,4,6,8})
     }
}
