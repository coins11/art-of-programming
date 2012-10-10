;(load "./lib.rkt")

(define (list-sum l)
  (cond
	[(empty? l) 0]
	[else (+ (car l) (list-sum (cdr l)))]))

