### Makefile --- 

## Author: shell@shell-deb.shdiv.qizhitech.com
## Version: $Id: Makefile,v 0.0 2012/10/23 08:40:13 shell Exp $
## Keywords: 
## X-URL: 
TARGET=24point-go 24point-racket

all: go racket sbcl lua python

build: $(TARGET)

clean:
	rm -f $(TARGET)

24point-go:
	go build 24point-go.go

go: 24point-go
	time ./24point-go

24point-racket:
	raco exe 24point-racket.scm

racket: 24point-racket
	time ./24point-racket

sbcl:
	time sbcl --script 24point-sbcl.lisp

lua:
	time lua 24point.lua

python:
	time python 24point.py

### Makefile ends here
