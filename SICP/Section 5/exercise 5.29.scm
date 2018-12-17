#lang sicp
(define (fib n)
  (if (< n 2)
      n
      (+ (fib (- n 1)) (fib (- n 2)))))


(fib 2)  ; (total-pushes = 72 maximum-depth = 13)
(fib 3)  ; (total-pushes = 128 maximum-depth = 18)
(fib 4)  ; (total-pushes = 240 maximum-depth = 23)
(fib 5)  ; (total-pushes = 408 maximum-depth = 28)
(fib 6)  ; (total-pushes = 688 maximum-depth = 33)
(fib 7)  ; (total-pushes = 1136 maximum-depth = 38)
(fib 8)  ; (total-pushes = 1864 maximum-depth = 43)
(fib 9)  ; (total-pushes = 3040 maximum-depth = 48)
(fib 10) ; (total-pushes = 4944 maximum-depth = 53)


; a. Maximum-depth = 5n + 3

; 16 16 72 128 240 408 688 1136 1864 3040 4944
;       k    40  40  40  40   40   40   40
;       32 88 200 368 648 1096 1824 3000 4904
;        56 112 168 280 448  728  1176 1904

; b.

; Total-pushes: S(n) = S(n-1) + S(n-2) + 40 (n >= 2) or 16 (n = 0, n = 1)
; k is an overhead of Fib(n) to add Fib(n-1) and Fib(n-2) (n >= 2).
; S(n) = 56*Fib(n) - 40