#lang racket
(define (fib n)
  (if (< n 3)
      1
      (+ (fib (- n 1)) (fib (- n 2)))
      ))
(write (fib 45))