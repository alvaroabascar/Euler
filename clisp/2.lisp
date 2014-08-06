(defun even-fib-sum (n)
  (do
   ((sum 0 (if (evenp a) (+ sum a) sum))
    (a 0 b)
    (b 1 (+ a b)))
   ((> a n) sum)))

(defun solve ()
  (format t "Solution: ~d~%" (even-fib-sum 4e6)))

(solve)
