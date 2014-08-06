(defun multiples-sum (n)
    (let ((sum 0))
      (loop for i from 0 to (1- n) do
	   (if (or (zerop (mod i 3))
		   (zerop (mod i 5)))
	       (incf sum i)))
      sum))

(defun solve ()
  (format t "Solution: ~d~%" (multiples-sum 1000)))

(solve)
