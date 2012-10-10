;(define pi 3.141592653589793)

(define (area shape a b)
  (cond
	[(eq? shape 'SECTOR)
	 (cond
	   [(and (>= a 0) (>= b 0) (<= b 360))
		(cond
		  [(eq? shape 'SECTOR) (* (* a a pi) (/ b 360))]
		  [else 'Undefined])]
	   [else 'Undefined])]
	[else
	 (cond
	   [(and (>= a 0) (>= b 0))
		(cond 
		  [(eq? shape 'TRIANGLE) (/ (* a b) 2)]
		  [(eq? shape 'RECTANGLE) (* a b)]
		  [(eq? shape 'CYLINDER) (+ (* (* a a pi) 2) (* (* a 2 pi) b))]
		  [else 'Undefined])]
	   [else 'Undefined])]))

