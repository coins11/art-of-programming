;(load "./lib.rkt")

(define (fold_left f init l)
  (cond
	[(empty? (cdr l)) (f init (car l))]
	[else (fold_left f (f init (car l)) (cdr l))]))

(define (unfold f i n)
  (define (sub f i n)
	(cond
	  [(> i n) empty]
	  [else (cons (f i) (sub f (+ i 1) n))]))
  (sub f i n))

(define (product l)
  (fold_left (lambda (p i) (* p i)) 1 l))

(define (make-list n f)
  (map (lambda (x) (f x)) (unfold (lambda (x) (+ x 1)) -1 (- n 2))))
