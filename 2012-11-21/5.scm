;10-5
(define (max3chain l)
    (if (<= 3 (length l))
        (max (+ (car l) (cadr l) (caddr l)) (max3chain (cdr l)))
        0))
