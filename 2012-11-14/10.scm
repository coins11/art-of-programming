;9-10
(define (compare a b)
    (cond
        ((> (* (car a) (cadr b)) (* (car b) (cadr a))) 'gt)
        ((= (* (car a) (cadr b)) (* (car b) (cadr a))) 'eq)
        ((< (* (car a) (cadr b)) (* (car b) (cadr a))) 'lt)))

(define (merge f l1 l2)
    (cond
        ((null? l1) l2)
        ((null? l2) l1)
        (else (case (f (car l1) (car l2))
            ((lt) (cons (car l1) (merge f (cdr l1) l2)))
            ((eq) (cons (car l1) (merge f (cdr l1) (cdr l2))))
            ((gt) (cons (car l2) (merge f l1 (cdr l2))))))))

(define (seq n m) (if (< m n) '() (cons n (seq (+ n 1) m))))

(define (farey n)
    (if (= n 0)
        '()
        (merge compare (farey (- n 1)) (map (lambda (x) (list x n)) (seq 0 n)))))
