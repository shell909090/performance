(require 'asdf)
(require :cl-ppcre)
(defun grepfile (filename)
  (let* ((cl-ppcre:*use-bmh-matchers* t)
         (cl-ppcre:*regex-char-code-limit* 256)
         (scanner (cl-ppcre:create-scanner "\d+ \d+")))
    (with-open-file (in filename)
      (loop for line = (read-line in nil) while line do
           (cl-ppcre:split scanner line)))
  ))

(defun main (args)
  (when args
    (grepfile (car args))
    (main (cdr args))))

(main (cdr *posix-argv*))
