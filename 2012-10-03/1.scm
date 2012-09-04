;4-1
(define (fold-left kons knil l)
  (if (null? l) knil (fold-left kons (kons (car l) knil) (cdr l))))
(define (list-sum l) (fold-left (lambda (x y) (+ x y)) 0 l))
