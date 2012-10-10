;(load "./lib.rkt")

(define-struct point (x y z))
(define-struct cube (c r))

(define (over c1 c2)
  (define c1-min (make-point
				(- (point-x (cube-c c1)) (/ (cube-r c1) 2))
				(- (point-y (cube-c c1)) (/ (cube-r c1) 2))
				(- (point-z (cube-c c1)) (/ (cube-r c1) 2))))
  (define c2-min (make-point
				(- (point-x (cube-c c2)) (/ (cube-r c2) 2))
				(- (point-y (cube-c c2)) (/ (cube-r c2) 2))
				(- (point-z (cube-c c2)) (/ (cube-r c2) 2))))
  (define c1-max (make-point
				(+ (point-x (cube-c c1)) (/ (cube-r c1) 2))
				(+ (point-y (cube-c c1)) (/ (cube-r c1) 2))
				(+ (point-z (cube-c c1)) (/ (cube-r c1) 2))))
  (define c2-max (make-point
				(+ (point-x (cube-c c2)) (/ (cube-r c2) 2))
				(+ (point-y (cube-c c2)) (/ (cube-r c2) 2))
				(+ (point-z (cube-c c2)) (/ (cube-r c2) 2))))

  (cond
	[(and
	   (<= (point-z c1-min) (point-z c2-max))
	   (>= (point-z c1-max) (point-z c2-min))
	   (<= (point-x c1-min) (point-x c2-max))
	   (>= (point-x c1-max) (point-x c2-min))
	   (<= (point-y c1-min) (point-y c2-max))
	   (>= (point-y c1-max) (point-y c2-min)))
	 #t]
	[else #f]))

(define c0 (make-cube (make-point 0 0 0) 10))
(define c1 (make-cube (make-point 6 0 0) 4))
(define c2 (make-cube (make-point 0 -8 0) 6))
