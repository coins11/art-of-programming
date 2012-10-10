;(load "./lib.rkt")

(define (list-replace l x y)
  (cond
	[(empty? l) empty]
	[(equal? x (car l)) (cons y (list-replace (cdr l) x y))]
	[else (cons (car l) (list-replace (cdr l) x y))]))
