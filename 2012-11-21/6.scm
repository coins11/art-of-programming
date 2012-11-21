;10-6
(define-struct pos (x y))

(define (distance p1 p2)
    (sqrt (+
        (expt (- (pos-x p2) (pos-x p1)) 2)
        (expt (- (pos-y p2) (pos-y p1)) 2))))

(define (tri-area a b c)
    (let ((s (/ (+ a b c) 2)))
        (sqrt (* s (- s a) (- s b) (- s c)))))

(define (tri-area_ p1 p2 p3)
    (tri-area (distance p1 p2) (distance p2 p3) (distance p1 p3)))

(define (pol-area l)
    (define (pol-area_ x y l)
        (if (null? l)
            0
            (+ (tri-area_ x y (car l)) (pol-area_ x (car l) (cdr l)))))
    (pol-area_ (car l) (cadr l) (cddr l)))
