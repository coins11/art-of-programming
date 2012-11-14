;9-7
(define-struct tree (label left right))

(define (tree-level n t)
    (cond
        ((null? t) '())
        ((= n 0) (list (tree-label t)))
        (else (append
            (tree-level (- n 1) (tree-left t))
            (tree-level (- n 1) (tree-right t))))))
