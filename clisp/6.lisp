(defun dif-sum-squares (min max)
  (do ((sum-squares 0)
       (sum 0)
       (num min (1+ num)))
      ((> num max) (progn
		     (format t "sum: ~d~%" sum)
		     (format t "sum2: ~d~%" (expt sum 2))
		     (format t "2sum: ~d~%" sum-squares)
		     (- (expt sum 2) sum-squares)))
       (incf sum num)
       (incf sum-squares (expt num 2))))

(defun dif-sum-squares2 (min max)
  (let ((nums (loop for i from min to max collect i)))
    (- (expt (apply #'+ nums) 2)
       (apply #'+ (map 'vector #'(lambda (x) (expt x 2)) nums)))))

(defun solve ()
  (format t "Solution: ~d" (dif-sum-squares2 1 100)))

(solve)

