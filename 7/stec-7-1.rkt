;(load "./lib.rkt")

(define (fold_left f init l)
  (cond
	[(empty? (cdr l)) (f init (car l))]
	[else (fold_left f (f init (car l)) (cdr l))]))

(define (fold_right f l init)
  (define (sub f l init)
	(cond
	  [(empty? (cdr l)) (f (car l) init)]
	  [else (sub f (cdr l) (f (car l) init)) ]))
  (sub f (reverse l) init))

(define (unfold f i n)
  (define (sub f i n)
	(cond
	  [(> i n) empty]
	  [else (cons (f i) (sub f (+ i 1) n))]))
  (sub f i n))

(define (sigma a b f)
  (cond
	[(<= a b)
	 (fold_left (lambda (x y) (+ x (f y))) 0 (unfold (lambda (x) (+ x 1)) (- a 1) (- b 1)) )]
	[else 0]))

(define (find pred l)
  (cond
	[(empty? l) 'Not_found]
	[(pred (car l)) (car l)]
	[else (find pred (cdr l))]))

(define (for-all? pred l)
  (cond
	[(empty? l) #t]
	[else (fold_left (lambda (x y) (and x (pred y))) #t l)]))

(define (exist? pred l)
  (cond
	[(empty? l) #f]
	[else (fold_left (lambda (x y) (or  x (pred y))) #f l)]))

(define (flatten l)
  (cond
	[(empty? l) empty]
	[(list? l) (fold_left (lambda (x y) (append x (flatten y))) empty l)]
	[else (list l)]))

(define (partition pred l)
  (cond
	[(empty? l) (list empty empty)]
	[else (fold_right (lambda (x y)
			   (cond
				 [(pred x) (list (cons x (car y)) (flatten (cdr y)))]
				 [else (list (car y) (flatten (cons x (cdr y))))])) l (list empty empty)) ]))

(define (make-list n f)
  (unfold f 0 (- n 1)))
