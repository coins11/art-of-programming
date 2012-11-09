;(load "./lib.rkt")
;
(define (fib n)
  (define (fib-iter n1 n2 count)
	(cond
	  [(> count 1) (fib-iter n2 (+ n1 n2) (- count 1))]
	  [else n1]))
  (cond [(= n 1) 1]
        [(= n 2) 1]
        [else (fib-iter 1 1 n)]))
