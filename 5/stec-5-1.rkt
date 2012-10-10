;(load "./lib.rkt")
;
;(define-struct z ())
;(define-struct s (p))

(define (plus n m)
  (to-racket (+ (to-num n) (to-num m))))

(define (sub n m)
  (to-racket (- (to-num n) (to-num m))))

(define (to-racket n)
  (cond
	[(= n 0) (make-z)]
	[else (make-s (to-racket (- n 1)))]))

(define (to-num n)
  (cond
	[(z? n) 0]
	[else (+ 1 (to-num (s-p n)))]))
