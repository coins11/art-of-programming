;9-3
(define-struct pos (x y))

(define (distance p1 p2)
    (sqrt (+ (expt (- (pos-x p1) (pos-x p2)) 2) (expt (- (pos-y p1) (pos-y p2)) 2))))

(define (prec head cur l)
    (cond
        ((null? l) (distance cur head))
        (else (+ (distance cur (car l)) (prec head (car l) (cdr l))))))

(define (perimeter l)
    (prec (car l) (car l) (cdr l)))
