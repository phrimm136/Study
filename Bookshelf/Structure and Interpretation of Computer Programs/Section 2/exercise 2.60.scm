#lang sicp
(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (cons x set))
(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2) (cons (car set1) (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))
(define (union-set set1 set2)
  (append set1 set2))

(define s1 (list 2 3 2 1 3 2 2))
(define s2 (list 2 4 2 4 2 4 2 4 4 2))

(adjoin-set 5 s1)
(intersection-set s1 s2)
(union-set s1 s2)