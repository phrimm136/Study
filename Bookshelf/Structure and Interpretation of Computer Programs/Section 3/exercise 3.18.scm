#lang sicp
(define (make-cycle x)
  (define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))
  (set-cdr! (last-pair x) x)
  x)


(define (check-cycle x)
  (let ((entered '()))
    (define (check x)
      (cond ((null? x) false)
            ((memq x entered) true)
            (else (set! entered (cons x entered)) (check (cdr x)))))
    (check (cdr x))))


(define l1 '(a b c))
(define l2 '(i))
(set-cdr! l2 l2)
(define l3 '(n m o))
(set-cdr! (cddr l3) l3)
(define l4 (make-cycle (list 'x 'y 'z)))

(check-cycle l1)
(check-cycle l2)
(check-cycle l3)
(check-cycle l4)