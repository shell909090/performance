### Makefile --- 

## Author: shell@DSK
## Version: $Id: Makefile,v 0.0 2012/10/26 16:11:11 shell Exp $
## Keywords: 
## X-URL: 
TARGET=sort-go sort-racket

build: $(TARGET)

clean:
	rm -f $(TARGET)

mount: mnt/data.txt

mnt/data.txt:
	mkdir -p mnt
	mount -t tmpfs nont mnt
	python makedata.py $@

umount:
	umount mnt

sort-go: sort-go.go
	go build $^
	chmod 755 $@

go: mnt/data.txt sort-go
	time ./sort-go $<

python: mnt/data.txt
	time python sort.py $<

sort-racket: sort-racket.scm
	raco exe $^

racket: mnt/data.txt sort-racket
	time ./racket $< 

### Makefile ends here
