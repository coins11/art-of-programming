;9-9
(define (seq n)
    (if (= n 0) '() (cons n (seq (- n 1)))))

(define (div-sum n)
    (apply + (filter (lambda (x) (= (remainder n x) 0)) (seq n))))
