;9-8
;(define-struct tree (label left right))

(define (split-at n l)
    (if (= n 0)
        (cons '() l)
        (let ((r (split-at (- n 1) (cdr l))))
            (cons (cons (car l) (car r)) (cdr r)))))

(define (list2comptree l n)
    (if (= n 0)
        '()
        (let* ((m (- n 1)) (r (split-at (- (expt 2 m) 1) (cdr l))))
            (make-tree (car l)
                (list2comptree (car r) m) (list2comptree (cdr r) m)))))
