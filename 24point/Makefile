### Makefile --- 

## Author: shell@shell-deb.shdiv.qizhitech.com
## Version: $Id: Makefile,v 0.0 2012/10/23 08:40:13 shell Exp $
## Keywords: 
## X-URL: 
TARGET=24point-go 24point-racket 24point_cython

all: go python cython pypy racket

build: $(TARGET)

clean:
	rm -f 24point_cython.c $(TARGET)

24point-go:
	go build 24point-go.go

go: 24point-go
	../perf -t 10 ./24point-go

# wrong algorithm
lua:
	../perf lua 24point.lua

python:
	../perf -t 10 python 24point.py

24point_cython.c: 24point_cython.pyx
	cython --embed $^

24point_cython: 24point_cython.c
	gcc $(shell python-config --includes) $(shell python-config --libs) -O2 -o $@ $^

cython: 24point_cython
	../perf -t 10 ./24point_cython

pypy:
	../perf -t 10 pypy 24point.py

# wrong program with guile
guile:
	../perf guile 24point.scm

24point-racket:
	raco exe 24point-racket.scm

racket: 24point-racket
	../perf -t 10 ./24point-racket

# wrong algorithm
sbcl:
	../perf sbcl --script 24point-sbcl.lisp

### Makefile ends here
