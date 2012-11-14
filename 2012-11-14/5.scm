;9-5
(define (ldrec n l)
    (if (null? l)
        '()
        (cons (* n (car l)) (ldrec (+ n 1) (cdr l)))))

(define (list-deriv l)
    (ldrec 1 (if (null? l) '() (cdr l))))
