### Makefile --- 

## Author: shell@shell-deb.shdiv.qizhitech.com
## Version: $Id: Makefile,v 0.0 2012/10/23 07:21:26 shell Exp $
## Keywords: 
## X-URL: 

all: go

clean:
	rm data.txt parse-go

data.txt:
	python makedata.py data.txt

parse-go:
	go build parse-go.go

go: data.txt parse-go
	time ./parse-go

### Makefile ends here
