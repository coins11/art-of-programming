;3-2
(define-struct point (x y z))
(define (distance p1 p2)
  (if (and (point? p1) (point? p2))
      (sqrt (+ (expt (- (point-x p1) (point-x p2)) 2)
               (expt (- (point-y p1) (point-y p2)) 2)
               (expt (- (point-z p1) (point-z p2)) 2)))
      'ERROR))
