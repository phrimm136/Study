#lang sicp
(define (equal? a b)
  (cond ((and (null? a) (null? b)) true)
        ((or (null? a) (null? b)) false)
        ((eq? (car a) (car b)) (equal? (cdr a) (cdr b)))
        (else false)))

(equal? '(this is a list) '(this is a list))
(equal? '(this is a list) '(this (is a) list))