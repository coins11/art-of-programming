;(load "./lib.rkt")
;(load "./lib.rkt")

(define-struct point (x y z))

(define (distance p1 p2)
  (cond
	[(and (point? p1) (point? p2))
	 (sqrt 
	   (+
		 (expt (- (point-x p1) (point-x p2)) 2)
		 (expt (- (point-y p1) (point-y p2)) 2)
		 (expt (- (point-z p1) (point-z p2)) 2)))]
	[else 'ERROR]))

(define p0 (make-point 0 0 0))
(define p1 (make-point 100 0 0))
(define p2 (make-point 0 200 0))
(define p3 (make-point 100 100 0))
