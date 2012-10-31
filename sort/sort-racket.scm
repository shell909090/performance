#lang racket
(define reline (regexp " +"))

(define (grepfile filename)
  (sort (map (lambda (line) (map string->number (regexp-split reline line)))
	     (file->lines filename))
	#:key cadr <))

(grepfile (vector-ref (current-command-line-arguments) 0))