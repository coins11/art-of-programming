;8-2
(define (palindrome l)
  (define (prec r l1)
    (if (null? (cdr l1)) (append l r) (prec (cons (car l1) r) (cdr l1))))
  (prec '() l))
