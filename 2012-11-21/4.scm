;10-4
(define-struct wp (header body))

(define (replace-wp wp s t)
    (define (replace-elem elem)
        (cond
            ((and (symbol? elem) (eq? elem s)) t)
            ((symbol? elem) elem)
            (else (replace-wp elem s t))))
    (make-wp (wp-header wp) (map replace-elem (wp-body wp))))
