(defmacro access (matrix &rest indices)
  (let ((expr matrix))
    (loop for index in indices do
	 (setf expr `(nth ,index ,expr)))
    expr))

(defun split-digits (line)
  (loop for pos from 0 to (1- (length line)) collect
       (parse-integer (subseq line pos (+ pos 1)))))

(defun load-nums ()
  (let ((in (open "13.input" :if-does-not-exist nil))
	(nums nil))
    (when in
      (loop for line = (read-line in nil) while line do
	   (push (split-digits line) nums)))
    nums))

(defun ten-digits-sum ()
  (let ((sum 0)
	(rem 0)
	(matrix (load-nums))
	(big-cool-num nil))
	(loop for i downfrom 49 to 9 do
	     (loop for col downfrom i to (- i 9) do
		  (dotimes (row 100)
		    (incf sum (access matrix row pos))))
	     (setf sum (- 

