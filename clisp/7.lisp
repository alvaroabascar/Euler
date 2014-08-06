(defun primep (num)
  (loop for fac from 2 to (ceiling (isqrt num)) never (zerop (mod num fac))))

(defun nth-prime (n)
  (do ((i 0)
       (num 2 (1+ num)))
      ((= i n) (1- num)) ;; stop after finding n primes
    (when (primep num)
      (incf i 1)
      (format t "~d: ~d~%" i num))))

(defun solve ()
  (format t "Solution: ~d~%" (nth-prime 10001)))

(solve)
       
