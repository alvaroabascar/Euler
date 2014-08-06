(defun primep (number)
    (loop for fac from 2 to (ceiling (isqrt number))
        never (zerop (mod number fac))))

;(defun largest-prime-factor (n)
;  (loop for fac from 2 to n do
;       (if (zerop (mod n fac))
;	   (let ((factor (/ n fac)))
;	     (if (primep factor) (return factor))))))

(defun largest-prime-factor (n)
  (do ((div (isqrt n) (1- div)))
      ((eq div 0))
    (if (and
	 (zerop (mod n div))
	 (primep div))
	(return div))))
	 

(defun solve ()
  (format t "Solution: ~d~%" (largest-prime-factor 600851475143)))

(solve)
