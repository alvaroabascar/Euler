(defun smallest-evenly-divisible (min max)

  (do ((num 1 (1+ num)) ;; number to be checked
       ()
       (if (loop for div from min to max always (zerop (mod num div))) (return num)))))

(defun solve ()
  (format t "Solution: ~d" (smallest-evenly-divisible 1 20)))

(solve)
