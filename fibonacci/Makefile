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

fib-c: fib-c.c
	gcc -O2 -o $@ $^

c: fib-c
	../perf ./fib-c

fib-go: fib-go.go
	go build $^
	chmod 755 $@

go: fib-go
	../perf ./fib-go

lua:
	../perf lua fib.lua

python:
	../perf python fib.py

fib_cython.c: fib_cython.pyx
	cython --embed $^

fib_cython: fib_cython.c
	gcc $(shell python-config --includes) $(shell python-config --libs) -O2 -o $@ $^

cython: fib_cython
	../perf ./fib_cython

pypy:
	../perf pypy fib.py

fib-rpython-c:
	translate.py fib-rpython.py

rpython: fib-rpython-c
	../perf ./fib-rpython-c

guile:
	guild compile fib.scm
	../perf guile fib.scm

fib-racket:
	raco exe fib-racket.scm

racket: fib-racket
	../perf ./fib-racket

sbcl:
	../perf sbcl --script fib.lisp

### Makefile ends here
