#lang sicp
(define x (list (list 1 2) (list 3 4)))

(define (fringe lst)
  (cond ((null? lst) nil)
        ((pair? (car lst)) (append (fringe (car lst)) (fringe (cdr lst))))
        (else lst)))

(fringe x)
(fringe (list x x))