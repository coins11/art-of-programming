(define (empty? l)
  (cond
	[(eq? l ()) #t]
	[else #f]))

(define empty ())

(define (fold_left f init l)
  (cond
	[(empty? (cdr l)) (f init (car l))]
	[else (fold_left f (f init (car l)) (cdr l))]))

(define alist (list (list 'a 3) (list 'b 10) (list 'c #t) (list 'd 0.3)))

(define (alist-mem k l)
  (fold_left (lambda (x y) (cond
							[(or (equal? k (car y)) x) #t]
							[else #f])) #f l))
