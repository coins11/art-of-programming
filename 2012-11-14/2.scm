;9-2
(define (list-split_ l)
    (cond
        ((null? l) (cons '() '()))
        ((null? (cdr l)) (cons l '()))
        (else
            (let ((r (list-split_ (cddr l))))
                (cons (cons (car l) (car r)) (cons (cadr l) (cdr r)))))))

(define (list-split l)
    (let ((r (list-split_ l)))
        (list (car r) (cdr r))))
