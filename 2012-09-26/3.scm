;3-3
(define-struct point (x y z))
(define-struct cube (c r))
(define (cube-x c) (point-x (cube-c c)))
(define (cube-y c) (point-y (cube-c c)))
(define (cube-z c) (point-z (cube-c c)))
(define (over c1 c2)
  (and (<= (* (abs (- (cube-x c1) (cube-x c2))) 2) (+ (cube-r c1) (cube-r c2)))
       (<= (* (abs (- (cube-y c1) (cube-y c2))) 2) (+ (cube-r c1) (cube-r c2)))
       (<= (* (abs (- (cube-z c1) (cube-z c2))) 2) (+ (cube-r c1) (cube-r c2)))))
