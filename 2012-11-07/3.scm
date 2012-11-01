;8-3
(define (fib n)
  (define (fibrec a b n)
    (if (= n 0) a (fibrec b (+ a b) (- n 1))))
  (fibrec 0 1 n))
