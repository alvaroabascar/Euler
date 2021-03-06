(defun multiples-3-5-below (num)
  "Return list of multiples of 3 and 5 below 1000"
  (loop for i from 1 to (1- num) when (or (zerop (mod i 3))
					  (zerop (mod i 5))) collect i))

(defun solve ()
  (format t "Solution: ~d~%" (reduce #'+ (multiples-3-5-below 1000))))

(solve)
					      
