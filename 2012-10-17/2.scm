;6-2
(define-struct wp (header body))

(define (any_ f l)
    (if (null? l)
        #f
        (or (f (car l)) (any_ f (cdr l)))))
(define (browze-wp wp)
    (if (wp? wp) (list (wp-header wp) (map browze-wp (wp-body wp))) wp))
(define (filter-wp* words wp)
    (if (wp? wp)
        (list (filter-wp words wp))
        (if (any_ (lambda (w) (eq? wp w)) words) '() (list wp))))
(define (filter-wp words wp)
    (make-wp (wp-header wp) (apply append (map (lambda (wp) (filter-wp* words wp)) (wp-body wp)))))
