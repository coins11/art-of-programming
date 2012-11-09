;(load "./lib.rkt")

(define dx 0.00001)
;(define pi 3.14159265)

(define (fold_left f init l)
  (cond
	[(empty? (cdr l)) (f init (car l))]
	[else (fold_left f (f init (car l)) (cdr l))]))

(define (deriv f)
  (lambda (x) (/ (- (f (+ x dx)) (f x)) dx)))

(define my-cos (deriv sin))

(define (unfold f i n)
  (define (sub f i n)
	(cond
	  [(>= i n) empty]
	  [else (cons (f i) (sub f (f i) n))]))
  (cons i (sub f i n)))

(define (integ f)
  (lambda (x)
	(let ((renge (cond
				   [(>= x 0) (unfold (lambda (j) (+ j dx)) 0 x)]
				   [else (unfold (lambda (j) (+ j dx)) x 0)]))
		  (dx (cond
				[(>= x 0) dx]
				[else (* dx -1)])))
	  (fold_left (lambda (s i) (+ s (* (f i) dx)))
				 0
				 renge))))
