### Makefile --- 

## Author: shell@DSK
## Version: $Id: Makefile,v 0.0 2012/10/27 02:05:11 shell Exp $
## Keywords: 
## X-URL: 

all: perf

clean:
	rm -f perf

perf: perf.go
	go build $^
	chmod 755 $@

### Makefile ends here
