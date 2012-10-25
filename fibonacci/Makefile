### Makefile --- 

## Author: shell@shell-deb.shdiv.qizhitech.com
## Version: $Id: Makefile,v 0.0 2012/10/23 02:44:13 shell Exp $
## Keywords: 
## X-URL: 
TARGET=fib-c fib-go fib_cython fib-rpython-c fib-racket

all: c go lua python cython pypy rpython guile racket sbcl

build: $(TARGET)

clean:
	rm -f *.pyc fib_cython.c $(TARGET)

fib-c:
	gcc -O2 -o fib-c fib-c.c

c: fib-c
	time ./fib-c

fib-go:
	go build fib-go.go

go: fib-go
	time ./fib-go

lua:
	time lua fib.lua

python:
	time python fib.py

fib_cython.c: fib_cython.pyx
	cython --embed $^

fib_cython: fib_cython.c
	gcc $(shell python-config --includes) $(shell python-config --libs) -O2 -o $@ $^

cython: fib_cython
	time ./fib_cython

pypy:
	time pypy fib.py

fib-rpython-c:
	translate.py fib-rpython.py

rpython: fib-rpython-c
	time ./fib-rpython-c

guile:
	guild compile lua.scm
	time guile lua.scm

fib-racket:
	raco exe fib-racket.scm

racket: fib-racket
	time ./fib-racket

sbcl:
	time sbcl --script fib.lisp

### Makefile ends here
