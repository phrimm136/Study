#lang sicp
(define (make-interval a b) (cons a b))
(define (lower-bound interval) (min (car interval) (cdr interval)))
(define (upper-bound interval) (max (car interval) (cdr interval)))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))

(lower-bound (sub-interval (make-interval 1 2) (make-interval 7 9)))
(upper-bound (sub-interval (make-interval 1 2) (make-interval 7 9)))