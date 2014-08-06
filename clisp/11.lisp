(defun split-by-one-space (line)
  (do
   ((pos nil)
    (split nil)) ;; list to be returned
   ((not line) (reverse split)) ;; return split when line is empty
    (setf pos (position #\space line)) ;; find first space
    ;; place str prior to space into split
    (push (subseq line 0 pos) split)
    ;; remove string up to the end of that space
    (if pos
	(setf line (subseq line (1+ pos)))
	(progn
	  (push line split)
	  (setf line nil)))))

(defun load-matrix ()
  (let ((in (open "11.input" :if-does-not-exist nil))
	(matrix (make-array 20 :adjustable t :fill-pointer 0))
	(row nil))
    (when in
      (loop for line = (read-line in nil) while line do
	 ;; load line as a list of numeric strings
	   (setf row (split-by-one-space line))
	 ;; turn those strings into integers
	   (setf row (map 'vector #'parse-integer row))
	 ;; place that vector into matrix
	   (vector-push row matrix))
      (close in)
      matrix)))

(defmacro access (matrix &rest indices)
  (let ((expr matrix))
    (loop for index in indices do
	 (setf expr `(aref ,expr ,index)))
    expr))

(defmacro replace-if (condition old new)
  `(if (funcall ,condition ,new ,old)
      (setf ,old ,new)))

(defun id (x &rest rest)
  x)

(defun adjacent (matrix row col oprow opcol)
  "Return four adjacent elements to matrix[row][col] in the same direction:

   right (oprow = #'id opcol = #'+)
   left  (oprow = #'id opcol = #'-)
   up    (oprow = #'-  opcol = #'id)
   up-left diagonal (oprow = #'- opcol = #'-)
   etc."
  (let ((rows (length (eval matrix)))
	(cols (length (access (eval matrix) 0))))
    (if (and
	 (> rows (funcall oprow row 3) -1)
	 (> cols (funcall opcol col 3) -1))
	(let ((result 
	       (loop for x from 0 to 3 collect 
		    (access matrix (funcall oprow row x) (funcall opcol col x)))))
	  (reverse result))
	'(0))))

(defmacro make-adjacent-function (name oprow opcol)
  "defuns a function named name, which takes a matrix, a row and a col, and
   returns 4 adjacent numbers in the same direction. The direction depends
   on oprow and opcol"
  `(defun ,name (matrix row col)
      (adjacent matrix row col ,oprow ,opcol)))

(make-adjacent-function adjacent-left #'id #'-)
(make-adjacent-function adjacent-right #'id #'+)
(make-adjacent-function adjacent-up #'- #'id)
(make-adjacent-function adjacent-down #'+ #'id)
(make-adjacent-function adjacent-up-left #'- #'-)
(make-adjacent-function adjacent-up-right #'- #'+)
(make-adjacent-function adjacent-down-left #'+ #'-)
(make-adjacent-function adjacent-down-right #'+ #'+)

(defun largest-adjacent-product (matrix row col)
  (max
   (reduce #'* (adjacent-left matrix row col))
   (reduce #'* (adjacent-right matrix row col))
   (reduce #'* (adjacent-up matrix row col))
   (reduce #'* (adjacent-down matrix row col))
   (reduce #'* (adjacent-up-left matrix row col))
   (reduce #'* (adjacent-up-right matrix row col))
   (reduce #'* (adjacent-down-left matrix row col))
   (reduce #'* (adjacent-down-right matrix row col))))

(defun largest-product ()
  (let ((matrix (load-matrix))
	(maxprod 0))
    (dotimes (row (length matrix))
      (dotimes (col (length (aref matrix 0)))
	(replace-if #'> maxprod (largest-adjacent-product matrix row col))))
    maxprod))

(defun solve ()
  (format t "Solution: ~d~%" (largest-product)))

(solve)
