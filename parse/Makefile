### Makefile --- 

## Author: shell@shell-deb.shdiv.qizhitech.com
## Version: $Id: Makefile,v 0.0 2012/10/23 07:21:26 shell Exp $
## Keywords: 
## X-URL: 
TARGET=parse-go parse_cython parse-racket

all: grep go lua python cython pypy guile racket sbcl

build: mnt/data.txt $(TARGET)

clean: umount
	rm -f *.c $(TARGET)

mount:
	mkdir mnt
	sudo mount -t tmpfs nont mnt

mnt/data.txt: mount
	python makedata.py $@

umount:
	sudo umount mnt
	rm -rf mnt

grep:
	../perf grep '\([0-9]\+\) \([0-9]\+\)' mnt/data.txt

parse-go: parse-go.go
	go build $^
	chmod 755 $@

go: parse-go
	../perf -l go ./parse-go

lua:
	../perf lua parse.lua

python:
	../perf python parse.py

parse_cython.c: parse_cython.pyx
	cython --embed $^

parse_cython: parse_cython.c
	gcc $(shell python-config --includes) $(shell python-config --libs) -O2 -o $@ $^

cython: parse_cython
	../perf -l cython ./parse_cython

pypy:
	../perf pypy parse.py

guile:
	guild compile parse.scm
	../perf guile parse.scm

parse-racket: parse-racket.scm
	raco exe $^

racket: parse-racket
	../perf -l racket ./parse_cython

sbcl:
	../perf sbcl --script parse.lisp mnt/data.txt

### Makefile ends here
