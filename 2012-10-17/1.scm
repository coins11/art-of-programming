;6-1
(define-struct tree (label children))

(define (tree-leaf? t) (null? (tree-children t)))
(define (tree-size t) (apply + 1 (map tree-size (tree-children t))))
(define (tree-height t) (+ 1 (apply max -1 (map tree-height (tree-children t)))))
(define (tree-list t) (cons (tree-label t) (apply append (map tree-list (tree-children t)))))
