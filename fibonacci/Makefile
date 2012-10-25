### Makefile --- 

## Author: shell@shell-deb.shdiv.qizhitech.com
## Version: $Id: Makefile,v 0.0 2012/10/23 02:44:13 shell Exp $
## Keywords: 
## X-URL: 
TARGET=test-c test-go test-cython test-rpython-c test-racket

all: c go py pypy guile racket

build: $(TARGET)

clean:
	rm -f *.pyc test-cython.c $(TARGET)

test-c:
	gcc -O2 -o test-c test-c.c

c: test-c
	time ./test-c

test-go:
	go build test-go.go

go: test-go
	time ./test-go

lua:
	time lua test-lua.lua

python:
	time python test-py.py

test-cython:
	cython --embed test-cython.pyx
	gcc $(shell python-config --includes) -O2 test-cython.c
	gcc $(shell python-config --libs) -o $@ test-cython.o

cython: test-cython
	time ./test-cython

pypy:
	time pypy test-py.py

test-rpython-c:
	translate.py test-rpython.py

rpython: test-rpython-c
	time ./test-rpython-c

guile:
	guild compile test-guile.scm
	time guile test-guile.scm

test-racket:
	raco exe test-racket.scm

racket: test-racket
	time ./test-racket

### Makefile ends here
