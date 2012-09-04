;3-2
(define pi 3.141592653589793)
(define (area kind a b)
  (cond ((and (eq? kind 'TRIANGLE) (< 0 a) (< 0 b))
            (/ (* a b) 2))
        ((and (eq? kind 'RECTANGLE) (< 0 a) (< 0 b))
            (* a b))
        ((and (eq? kind 'ELLIPSE) (< 0 a) (< 0 b))
            (* pi a b))
        ((and (eq? kind 'SECTOR) (< 0 a) (< 0 b) (<= b 360))
            (* pi a a (/ b 360)))
        (else
            'Undefined)))
