#lang sicp
(define (element-of-set? x set)
  (cond ((null? set) false)
        ((= x (car set)) true)
        ((< x (car set)) false)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (cond ((null? set) (cons x nil))
        ((> x (car set)) (cons (car set) (adjoin-set x (cdr set))))
        ((= x (car set)) set)
        (else (cons x set))))

(define set (list 1 3 5 7))

(adjoin-set 0 set)
(adjoin-set 1 set)
(adjoin-set 4 set)
(adjoin-set 9 set)

; Like element-of-set? ,
; it will be able to stop searching at a point near the beginning of the list or near the end.
; So it halves time unordered procedure needs.