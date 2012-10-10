;(load "./lib.rkt")

;(define-struct add (left right))
;(define-struct sub (left right))
;(define-struct mul (left right))
;(define-struct div (left right))
;(define-struct num (val))
;(define-struct var (name))

(define (alist-assoc k l)
  (cond
	[(empty? l) 0]
	[(equal? k (car (car l))) (car (cdr (car l)))]
	[else (alist-assoc k (cdr l))]))

(define (myeval env expr)
  (cond
	[(num? expr) (num-val expr)]
	[(var? expr) (alist-assoc (var-name expr) env)]
	[(add? expr) (+ (myeval env (add-left expr)) (myeval env (add-right expr)))]
	[(sub? expr) (- (myeval env (sub-left expr)) (myeval env (sub-right expr)))]
	[(mul? expr) (* (myeval env (mul-left expr)) (myeval env (mul-right expr)))]
	[(div? expr) (cond
				   [(zero? (myeval env (div-right expr))) 0]
				   [else (/ (myeval env (div-left expr)) (myeval env (div-right expr)))])]))

