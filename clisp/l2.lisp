(defun fib-generator (a b)
  (lambda ()
    (let ((tmp b))
      (incf b a)
      (setf a tmp))
    a))

(defun even-fib-sum (n)
  (let ((next-fib (fib-generator 0 1))) ;; next-fib returns the next fib (closure)
    (do ((term 0 (funcall next-fib)) ;; last fib produced
	 (even-fibs nil)) ;; list containing the even fibs
	 ((> term n) (reduce #'+ even-fibs)) ;; return the sum of even fibs

      (if (evenp term) (push term even-fibs)))))

(defun solve ()
  (format t "Solution: ~d~%" (even-fib-sum 4e6)))

(solve)
