#lang sicp
(define (mystery x)
  (define (loop x y)
    (if (null? x)
        y
        (let ((temp (cdr x)))
          (set-cdr! x y)
          (loop temp x))))
  (loop x '()))

; Append reverse version of x to y. But y is null list, so it reverses parameter list.


(define v (list 'a 'b 'c 'd))

; v──>a│──>b│──>c│──>d│\

(define w (mystery v))

; w──>d│──>c│──>b│──>a│\
;                    ∧
;                    v