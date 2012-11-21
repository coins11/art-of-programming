;10-9
(define (embed? xs ys)
    (cond
        ((null? xs) #t)
        ((null? ys) #f)
        ((eq? (car xs) (car ys)) (embed? (cdr xs) (cdr ys)))
        (else (embed? xs (cdr ys)))))
