#lang racket
(define (chkexp target)
  (lambda (e v)
    (when (eq? v target)
	  (write e)
	  (newline))))

(define (exchangeable op)
  (not (member op (list - /))))

(define (iter-all-exp f ops ns e v)
  (cond
   ((null? ns) (f e v))
   ((null? e)
    (for ((r (remove-duplicates ns)))
	 (iter-all-exp f ops (remove r ns) r r)))
   (else
    (for ((r (remove-duplicates ns)))
	 (let ((nss (remove r ns)))
	   (for ((op ops))
		(iter-all-exp f ops nss (list op e r) (op v r))
		(unless (exchangeable op)
			(iter-all-exp f ops nss (list op r e) (op r v)))))))
   ))

(for ((i (in-range 100)))
     (iter-all-exp (chkexp 24) (list + - * /) (list 3 4 6 8) '() 0))
