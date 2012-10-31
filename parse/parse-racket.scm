#lang racket
(define reline (regexp " +"))

(define (grepfile filename)
  (with-input-from-file	filename
    (lambda ()
      (do ((line (read-line) (read-line)))
	  ((eof-object? line))
	(regexp-split reline line)))))

(grepfile "mnt/data.txt")
