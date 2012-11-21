;10-10
(define (fold-right kons knil l)
  (if (null? l) knil (kons (car l) (fold-right kons knil (cdr l)))))
(define (filter pred l) (fold-right (lambda (x l) (if (pred x) (cons x l) l)) [] l))0

(define (invf f)
    (define fl (map (lambda (n) (cons (f n) n)) '(0 1 2 3 4 5 6 7 8 9 10)))
    (lambda (x)
        (if (null? (filter (lambda (p) (eq? x (car p))) fl))
            '()
            (cdr (car (filter (lambda (p) (eq? x (car p))) fl))))))
