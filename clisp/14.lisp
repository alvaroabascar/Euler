(defun sequence-length (start-num)
  (let ((len 0))
    (labels ((next (num)
	       (incf len)
	       (if (= num 1)
		   len
		   (cond ((evenp num) (next (/ num 2)))
			 ((oddp num) (next (+ (* 3 num) 1)))))))
      (next start-num))))

(find-largest-seq-below (num)
  (let ((longest 0)
	(best-num 0))
    (dotimes (i num)
      (let ((len (sequence-length i) longest))
	(when (> len (longest))
	    (setf longest len)
	    (setf best-num i))))
    best-num))

(defun solve ()
  (find-largest-seq-below 1e6))
			
