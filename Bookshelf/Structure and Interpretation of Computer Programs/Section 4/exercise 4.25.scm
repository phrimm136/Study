#lang sicp
(define (unless condition usual-value exceptional-value)
  (if condition exceptional-value usual-value))


(define (factorial n)
  (unless (= n 1) (* n (factorial (- n 1))) 1))

(factorial 5)

; unless we implemented is procedure, so it's applicative-order.
; While applying unless, it evaluates factorial, and factorial evaluates unless, over and over...
; It causes infinite recursion.