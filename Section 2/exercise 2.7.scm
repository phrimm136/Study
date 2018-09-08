#lang sicp
(define (make-interval a b) (cons a b))
(define (lower-bound interval) (min (car interval) (cdr interval)))
(define (upper-bound interval) (max (car interval) (cdr interval)))

(lower-bound (make-interval 4 5))
(upper-bound (make-interval 5 4))