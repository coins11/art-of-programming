;2-1
(define (middle3 x y z)
  (cond
    ((and (<= y x) (<= x z)) x)
    ((and (<= z x) (<= x y)) x)
    ((and (<= x y) (<= y z)) y)
    ((and (<= z y) (<= y x)) y)
    ((and (<= x z) (<= z y)) z)
    ((and (<= y z) (<= z x)) z)))

(define (fold-left kons knil l)
  (if (null? l) knil (fold-left kons (kons (car l) knil) (cdr l))))
(define (max x y) (if (<= x y) y x))
(define (maximum x . l) (fold-left max x l))
(define max5 maximum)
