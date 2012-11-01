;8-1
(define (product l)
  (define (prec x l) (if (null? l) x (prec (* x (car l)) (cdr l))))
  (prec 1 l))

(define (make-list n f)
  (define (mlrec l n) (if (= n 0) l (mlrec (cons (f (- n 1)) l) (- n 1))))
  (mlrec '() n))
