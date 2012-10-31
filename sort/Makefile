### Makefile --- 

## Author: shell@DSK
## Version: $Id: Makefile,v 0.0 2012/10/26 16:11:11 shell Exp $
## Keywords: 
## X-URL: 
TARGET=sort-go sort-racket

all: go lua python racket

build: mnt/data.txt $(TARGET)

clean: umount
	rm -f $(TARGET)

mount:
	mkdir mnt
	sudo mount -t tmpfs nont mnt

mnt/data.txt: mount
	python makedata.py $@

umount:
	sudo umount mnt
	rm -rf mnt

sort-go: sort-go.go
	go build $^
	chmod 755 $@

go: sort-go
	../perf ./sort-go mnt/data.txt

lua:
	../perf lua sort.lua

python:
	../perf python sort.py mnt/data.txt

sort-racket: sort-racket.scm
	raco exe $^

racket: sort-racket
	../perf ./sort-racket mnt/data.txt

sbcl: mnt/data.txt

### Makefile ends here
