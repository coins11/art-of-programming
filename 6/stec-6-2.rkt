;(load "./lib.rkt")
;
;(define-struct wp (header body))
;
;(define wp3 (make-wp 'wp3 (list 'hello 'world)))
;(define wp2 (make-wp 'wp2 (list 'violence 'dangerous)))
;(define wp1 (make-wp 'wp1 (list 'no 'problem wp2 wp3)))
;
;(define black-list (list 'violence 'terrorist))

(define (fold_left f init l)
  (cond
	[(empty? (cdr l)) (f init (car l))]
	[else (fold_left f (f init (car l)) (cdr l))]))

(define (browze-wp p)
  (define (browze l)
	(fold_left (lambda (x y)
				 (append x
						 (list (cond
						   [(wp? y) (browze-wp y)]
						   [else y])))) empty l))
  
  (cons (wp-header p) (list (browze (wp-body p)))))

(define (filter-wp bl p)
  (define (exists? a l)
	(fold_left (lambda (x y) (or x (eq? a y))) #f l))

  (define (filtering h l)
	(make-wp h 
			 (fold_left (lambda (x y)
						  (append x
							(cond
							  [(wp? y) (list (filtering (wp-header y) (wp-body y)))]
							  [(exists? y bl) empty]
							  [else (list y)]))) empty l)))
  (filtering (wp-header p) (wp-body p)))
