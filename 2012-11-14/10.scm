;9-10
(define (compare a b)
    (cond
        ((> (* (car a) (cdr b)) (* (car b) (cdr a))) 'gt)
        ((= (* (car a) (cdr b)) (* (car b) (cdr a))) 'eq)
        ((< (* (car a) (cdr b)) (* (car b) (cdr a))) 'lt)))

(define (merge f l1 l2)
    (cond
        ((null? l1) l2)
        ((null? l2) l1)
        (else (case (f (car l1) (car l2))
            ((lt) (cons (car l1) (merge f (cdr l1) l2)))
            ((eq) (cons (car l1) (merge f (cdr l1) (cdr l2))))
            ((gt) (cons (car l2) (merge f l1 (cdr l2))))))))

(define (seq n m) (if (< m n) '() (cons n (seq (+ n 1) m))))

(define (farey_ n)
    (if (= n 0)
        '()
        (merge compare (farey_ (- n 1)) (map (lambda (x) (cons x n)) (seq 0 n)))))

(define (farey n)
    (map (lambda (x) (list (car x) (cdr x))) (farey_ n)))
