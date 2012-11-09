(use srfi-9)

(define-macro (define-struct name fields)
  (let ((constructor (string->symbol #`"make-,|name|"))
        (predicate (string->symbol #`",|name|?"))
        (acc&mods (map (lambda (field)
                         (list field
                               (string->symbol #`",|name|-,|field|")
                               (string->symbol #`"set-,|name|-,|field|!")))
                       fields)))
    `(define-record-type
       ,name
       (,constructor ,@fields)
       ,predicate
       ,@acc&mods)))

(define (empty? l)
  (cond
	[(eq? l ()) #t]
	[else #f]))

(define empty ())

(define (normalize l)
  (cond
	[(list? l) (fold_left (lambda (x y) (append x (normalize y))) empty l)]
	[else (list l)]))
