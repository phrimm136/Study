#lang sicp
(define (make-cycle x)
  (define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))
  (set-cdr! (last-pair x) x)
  x)


(define (check-cycle x)
  (define (check x y)
    (cond ((null? y) false)
          ((eq? x y) true)
          ((null? (cdr y)) false)
          (else (check (cdr x) (cddr y)))))
    (check x (cdr x)))


(define l1 '(a b c))
(define l2 '(i))
(set-cdr! l2 l2)
(define l3 '(n m o))
(set-cdr! (cddr l3) l3)
(define l4 (make-cycle (list 'x 'y 'z)))
(define l5 (list 'a 'b))
(set-cdr! (cdr l5) (cdr l5))

(check-cycle l1)
(check-cycle l2)
(check-cycle l3)
(check-cycle l4)
(check-cycle l5)