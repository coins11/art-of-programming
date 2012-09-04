;4-2
(define (list-replace l before after)
  (map (lambda (elem) (if (eq? elem before) after elem)) l))
