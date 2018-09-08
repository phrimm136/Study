#lang sicp
(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things) (cons (square (car things)) answer))))
  (iter items nil))

; This procedure will produce a reversed answer
; because it produces a pair with the latest value and link the pair at the first of list.

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things) (cons answer (square (car things))))))
  (iter items nil))

; Only linking direction is changed. (to right)