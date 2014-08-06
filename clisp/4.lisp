(defun largest-palindrome (n)
  (let ((largest-num (1- (expt 10 n)))
	 (prod nil)
	 (str nil)
	 (max 0))

    (block  outer-loop
      (loop for a from 0 to largest-num do
	   (loop for b from 0 to largest-num do
		(setf prod (* (- largest-num a) (- largest-num b)))
		(setf str (write-to-string prod))
		(if (and (equal str (reverse str))
			 (> prod max))
		    (setf max prod)))))
    max))

(defun solve ()
    (format t "Solution: ~d~%" (largest-palindrome 3)))

(solve)
