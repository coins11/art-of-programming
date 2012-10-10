(define (middle3 a b c)
  (cond
	[(or (<= a b c) (<= c b a)) b]
	[else (middle3 c a b)]))

(define (max5 a b c d e)
  (cond
	[(and (>= a b) (>= a c) (>= a d) (>= a e)) a]
	[else (max5 e a b c d)]))

