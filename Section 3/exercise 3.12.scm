#lang sicp
(define (get-new-pair) '(() ()))

(define (cons x y)
  (let ((new (get-new-pair)))
    (set-car! new x)
    (set-cdr! new y)
    new))

(define (append! x y)
  (set-cdr! (last-pair x) y)
  x)

(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))


(define x (list 'a 'b))
(define y (list 'c 'd))
(define z (append x y))

z ; (a b c d)
(cdr x) ; (b)

(define w (append! x y))

w ; (a b c d)
(cdr x) ; (b c d)

; x──>a│──>b│\
; y──>c│──>d│\

; z──>a│──>b│──>c│──>d│\

;     x
;     ∨
; w──>a│──>b│──┐   y
;              │   ∨
;              └──>c│◎──>d│\