(defun pythagorean-triplet-product (condition)
  (block outer
    (loop for a from 1 to 1000 do
	 (loop for b from a to (- 1000 a) do
	      (let ((c (sqrt (+ (expt a 2) (expt b 2)))))
		(when (and
		     (zerop (mod c 1)) ;; is c an integer?
		     (funcall condition a b c))
		  (return-from outer (* a b c))))))))

(defun solve ()
  (format t "Solution: ~d~%" (pythagorean-triplet-product
			      #'(lambda (a b c) (= 1000 (+ a b c))))))

(solve)
