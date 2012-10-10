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
