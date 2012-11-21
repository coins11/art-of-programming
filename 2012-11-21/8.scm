;10-8
(define-struct tree (label left right))

(define (height-range t)
    (if (null? t)
        (list 0 0)
        (let ((lr (height-range (tree-left t)))
              (rr (height-range (tree-right t))))
            (list (+ 1 (min (car lr) (car rr)))
                  (+ 1 (max (cadr lr) (cadr rr)))))))

(define (balance-factor t)
    (define range (height-range t))
    (- (cadr range) (car range)))
