(defmacro divisor (div num)
  `(zerop (mod ,num ,div)))

(defun divisors (num)
  (let ((divs-below-sqrt)
	(divs-above-sqrt))
    (setf divs-below-sqrt
	  (loop for fac from 1 to (floor (isqrt num)) when (divisor fac num)
	     collect fac))
    (setf divs-above-sqrt
	  (loop for div in divs-below-sqrt collect (/ num div)))
    (remove-duplicates (concatenate 'list divs-below-sqrt divs-above-sqrt))))

(defmacro n-divisors (num)
  `(length (divisors ,num)))

(defun simple-n-divisors (num)
  (length
   (loop for i from 1 to num when (divisor i num) collect i)))

(defun make-next-triangle-function ()
  (let ((last-triangle 0)
	(i 0))
    #'(lambda ()
	(incf i 1)
	(incf last-triangle i)
	last-triangle)))

(defun find-triangle-over-n-divisors (n-divs)
  (let ((triangle 0)
	(next-triangle (make-next-triangle-function)))
	
	(loop until (> (n-divisors triangle) n-divs) do
	     (setf triangle (funcall next-triangle)))
    triangle))

(defun solve ()
  (format t "Solution: ~d~%" (find-triangle-over-n-divisors 500)))

(solve)
