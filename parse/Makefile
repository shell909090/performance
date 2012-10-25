### Makefile --- 

## Author: shell@shell-deb.shdiv.qizhitech.com
## Version: $Id: Makefile,v 0.0 2012/10/23 07:21:26 shell Exp $
## Keywords: 
## X-URL: 
TARGET=data.txt parse-go parse_cython

all: data.txt go

build: $(TARGET)

clean:
	rm -f $(TARGET)

data.txt:
	python makedata.py data.txt

parse-go:
	go build parse-go.go

go: data.txt parse-go
	time ./parse-go

lua: data.txt
	time lua parse.lua

python: data.txt
	time python parse.py

parse_cython.c: parse_cython.pyx
	cython --embed $^

parse_cython: parse_cython.c
	gcc $(shell python-config --includes) $(shell python-config --libs) -O2 -o $@ $^

cython: data.txt parse_cython
	time ./parse_cython

pypy:
	time pypy parse.py

guile:
	time guile parse.scm

racket: data.txt
	time racket -r parse-racket.scm

sbcl: data.txt
	time sbcl --script parse.lisp

### Makefile ends here
