;(load "./lib.rkt")

(define-struct expr (opc opr1 opr2))

(define (myeval e)
  (cond
	[(eq? 'PLUS (expr-opc e)) (+ (expr-opr1 e) (expr-opr2 e))]
	[(eq? 'MUL  (expr-opc e)) (* (expr-opr1 e) (expr-opr2 e))]
	[(eq? 'DIV  (expr-opc e)) (/ (expr-opr1 e) (expr-opr2 e))]
	[(eq? 'SUB  (expr-opc e)) (- (expr-opr1 e) (expr-opr2 e))]))
