(defun chkexp (target)
  (lambda (e)
    (if (equal (ignore-errors (eval e)) target) (print e))))
(defun exchangeable (op)
  (not (member op '(- /))))
(defun iter-all-exp (f ops ns &optional e)
  (cond
    ((not ns) (funcall f e))
    ((not e) (dolist (r (remove-duplicates ns))
	       (iter-all-exp f ops (remove r ns :count 1) r)))
    (t (dolist (r (remove-duplicates ns))
	 (let ((nss (remove r ns :count 1)))
	   (dolist (op ops)
	     (iter-all-exp f ops nss `(,op ,e ,r))
	     (if (not (exchangeable op))
		 (iter-all-exp f ops nss `(,op ,r ,e)))))))))
(iter-all-exp (chkexp 24) `(+ - * /) `(3 4 6 8))