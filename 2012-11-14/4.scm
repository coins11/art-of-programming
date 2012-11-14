;9-4
(define (fold-right kons knil l)
    (if (null? l) knil (kons (car l) (fold-right kons knil (cdr l)))))
(define (filter pred l)
    (fold-right (lambda (x l) (if (pred x) (cons x l) l)) [] l))
(define (remove-dup l)
    (cond
        ((null? l) '())
        (else (cons (car l) (filter (lambda (x) (not (eq? x (car l)))) (remove-dup (cdr l)))))))
