;9-6
(define (lfrec x n l)
    (if (null? l)
        0
        (+ (* (expt x n) (car l)) (lfrec x (+ n 1) (cdr l)))))

(define (list2fun l)
    (lambda (x) (lfrec x 0 l)))
