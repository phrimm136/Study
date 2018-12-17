#lang sicp
(define (factorial n)
  (if (= n 1)
      1
      (* (factorial (- n 1)) n)))


(factorial 1)  ; (total-pushes = 16 maximum-depth = 8)
(factorial 2)  ; (total-pushes = 48 maximum-depth = 13)
(factorial 3)  ; (total-pushes = 80 maximum-depth = 18)
(factorial 4)  ; (total-pushes = 112 maximum-depth = 23)
(factorial 5)  ; (total-pushes = 144 maximum-depth = 28)
(factorial 6)  ; (total-pushes = 176 maximum-depth = 33)
(factorial 7)  ; (total-pushes = 208 maximum-depth = 38)
(factorial 8)  ; (total-pushes = 240 maximum-depth = 43)
(factorial 9)  ; (total-pushes = 272 maximum-depth = 48)
(factorial 10) ; (total-pushes = 304 maximum-depth = 53)

; total-pushes = 32n - 16
; maximum-depth = 5n + 3


;                Maximum depth      Number of pushes
; Recursive    Linearly increase    Linearly increase
; Factorial         5n + 3              32n - 16
; Iterative        Constant         More quickly inc.
; Factorial           10                35n + 29

; Iterative procedure is superior in space, but inferior in time.