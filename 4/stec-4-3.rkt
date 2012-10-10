;(load "./lib.rkt")

;(define alist (list (list 'a 3) (list 'b 10) (list 'c #t) (list 'd 0.3)))

(define (alist-assoc k l)
  (cond
	[(empty? l) 'Not_found]
	[(equal? k (car (car l))) (car (cdr (car l)))]
	[else (alist-assoc k (cdr l))]))

(define (alist-mem k l)
  (cond
	[(equal? (alist-assoc k l) 'Not_found) #f]
	[else #t]))

(define (alist-add k v l)
  (cond
	[(empty? l) (list (list k v))]
	[(equal? k (car (car l))) (cons (list k v) (cdr l))]
	[else (cons (car l) (alist-add k v (cdr l)))]))

(define (alist-remove k l)
  (cond
	[(empty? l) empty]
	[(equal? k (car (car l))) (cdr l)]
	[else (cons (car l) (alist-remove k (cdr l)))]))

(define (alist-keys l)
  (cond
	[(empty? l) empty]
	[else (cons (car (car l)) (alist-keys (cdr l)))]))

(define (alist-values l)
  (cond
	[(empty? l) empty]
	[else (cons (car (cdr (car l))) (alist-values (cdr l)))]))

