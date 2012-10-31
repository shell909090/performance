### Makefile --- 

## Author: shell@shell-deb.shdiv.qizhitech.com
## Version: $Id: Makefile,v 0.0 2012/10/23 08:40:13 shell Exp $
## Keywords: 
## X-URL: 
TARGET=24point-go 24point-racket 24point_cython

all: go lua python cython pypy racket sbcl

build: $(TARGET)

clean:
	rm -f 24point_cython.c $(TARGET)

24point-go: 24point-go.go
	go build $^
	chmod 755 $@

go: 24point-go
	../perf -l go ./24point-go

lua:
	../perf lua 24point.lua

python:
	../perf python 24point.py

24point_cython.c: 24point_cython.pyx
	cython --embed $^

24point_cython: 24point_cython.c
	gcc $(shell python-config --includes) $(shell python-config --libs) -O2 -o $@ $^

cython: 24point_cython
	../perf -l cython ./24point_cython

pypy:
	../perf pypy 24point.py

24point-racket:
	raco exe 24point-racket.scm

racket: 24point-racket
	../perf -l racket ./24point-racket

sbcl:
	../perf sbcl --script 24point.lisp

### Makefile ends here
