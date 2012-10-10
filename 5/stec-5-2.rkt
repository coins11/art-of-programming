;(load "./lib.rkt")
;
;(define-struct child (father mother name date eyes))
;
;(define Carl (make-child empty empty 'Carl 1926 'green))
;(define Bettina (make-child empty empty 'Bettina 1926 'green))
;(define Adam (make-child Carl Bettina 'Adam 1955 'black))
;(define Dave (make-child Carl Bettina 'Dave 1950 'yellow))
;(define Eva (make-child Carl Bettina 'Eva 1965 'blue))
;(define Fred (make-child empty empty 'Fred 1938 'black))
;(define Grace (make-child empty empty 'Grace 1940 'blue))
;(define Harry (make-child Fred Grace 'Harry 1966 'blue))
;(define Iwan (make-child Harry Eva 'Iwan 1987 'yellow))
;(define Janet (make-child empty empty 'Jacob 1959 'blue))
;(define Katie (make-child Adam Janet 'Katie 1985 'blue))

(define (myeq? a b)
  (cond
	[(and (empty? a) (empty? b)) #f]
	[else (eq? a b)]))

(define (brother? c1 c2)
  (and (myeq? (child-mother c1) (child-mother c2)) (myeq? (child-father c1) (child-father c2))))

(define (get-parent n)
  (cond
	[(empty? n) empty]
	[else (list (child-father n) (child-mother n))]))

(define (fold_left f init l)
  (cond
	[(empty? (cdr l)) (f init (car l))]
	[else (fold_left f (f init (car l)) (cdr l))]))

(define (child-gfathers c)
  (fold_left (lambda (x y) (cond
							 [(empty? y) x]
							 [(cons (child-name y) x)])) empty
			 (fold_left (lambda (x y)
						  (cond
							[(empty? y) x]
							[else (cons (child-father y) x)])) empty (get-parent c))))

(define (ancestor c)
  (cond
	[(empty? c) empty]
	[else (cons (child-name c) (append (ancestor (child-father c)) (ancestor (child-mother c))))]))
