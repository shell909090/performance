(defun fib (n)
  (declare (optimize (speed 3) (safety 0)))
  (declare (fixnum n))
  (if (< n 3)
      1
      (+ (fib (- n 1)) (fib (- n 2)))
      ))
(write (fib 45))