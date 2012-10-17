;(load "./lib.rkt")
;
;(define-struct tree (label children))
;
;(define tree1 (make-tree 'a empty))
;(define tree2 (make-tree 'b (list tree1)))
;(define tree3 (make-tree 'c (list tree1 (make-tree 'd (list tree2)))))

(define (fold_left f init l)
  (cond
	[(empty? (cdr l)) (f init (car l))]
	[else (fold_left f (f init (car l)) (cdr l))]))

(define (tree-leaf? t) (empty? (tree-children t)))

(define (tree-size tr)
  (define (size t)
	(fold_left (lambda (x y)
				 (+ x
					(cond
					  [(tree-leaf? y) 1]
					  [else (size (tree-children y))] ))) 1 t))
  (- (size (list tr)) 1))

(define (tree-height tr)
  (define (height t)
	  (car (reverse (sort (map (lambda (x)
									   (cond
										 [(tree-leaf? x) 0]
										 [(+ 1 (height (tree-children x)))])) t) ))))
  (height (list tr)))

(define (tree-list tr)
  (define (normalize l)
  (cond
	[(list? l) (fold_left (lambda (x y) (append x (normalize y))) empty l)]
	[else (list l)]))

  (define (mlist t)
	(map (lambda (x)
		   (cond
			 [(tree-leaf? x) (tree-label x)]
			 [else (cons (tree-label x) (mlist (tree-children x)))])) t))
  (normalize (mlist (list tr))))
