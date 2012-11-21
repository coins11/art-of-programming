;10-7
(define-struct tree (label left right))

(define (sumtree t)
    (if (null? t)
        0
        (+ (tree-label t) (sumtree (tree-left t)) (sumtree (tree-right t)))))
