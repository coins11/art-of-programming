;2-2
(define (calc-time h m)
  (+ (* 57.5 h)
     (cond ((< m 40) (* 1.25 m))
           ((< m 50) (+ 50 (* 0.75 (- m 40))))
           (else     57.5))))
