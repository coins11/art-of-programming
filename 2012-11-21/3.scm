;10-3
(define (fold-right kons knil l)
  (if (null? l) knil (kons (car l) (fold-right kons knil (cdr l)))))
(define (filter pred l) (fold-right (lambda (x l) (if (pred x) (cons x l) l)) [] l))

(define (sqrlist l) (map (lambda (x) (* x x)) (filter (lambda (x) (<= 0 x)) l)))
