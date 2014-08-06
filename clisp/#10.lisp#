(defun primep (num)
  (loop for i from 2 to (ceiling (isqrt num)) never (zerop (mod num i))))
  
(defun primes-below (num)
  "Return a list of all primes below num"
  (loop for i from 2 to (1- num) when (primep i) collect i))

(defun sum-primes-below (num)
  "Sum all the prime numbers below num"
  (reduce #'+ (primes-below num)))

(defun solve ()
  (format t "Solution: ~d~%" (sum-primes-below 2e6)))

(solve)
