#lang sicp
(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(define (union-set set1 set2)
    (cond ((null? set1) set2)
          ((element-of-set? (car set1) set2) (union-set (cdr set1) set2))
          (else (cons (car set1) (union-set (cdr set1) set2)))))

(define s1 (list 1 2 3 4))
(define s2 (list 2 4 6 8))

(union-set s1 s2)