#lang sicp
(define (factorial n)
  (define (iter product counter)
    (if (> counter n)
        product
        (iter (* counter product) (+ counter 1))))
  (iter 1 1))


(factorial 1)  ; (total-pushes = 64 maximum-depth = 10)
(factorial 2)  ; (total-pushes = 99 maximum-depth = 10)
(factorial 3)  ; (total-pushes = 134 maximum-depth = 10)
(factorial 4)  ; (total-pushes = 169 maximum-depth = 10)
(factorial 5)  ; (total-pushes = 204 maximum-depth = 10)
(factorial 6)  ; (total-pushes = 239 maximum-depth = 10)
(factorial 7)  ; (total-pushes = 274 maximum-depth = 10)
(factorial 8)  ; (total-pushes = 309 maximum-depth = 10)
(factorial 9)  ; (total-pushes = 344 maximum-depth = 10)
(factorial 10) ; (total-pushes = 379 maximum-depth = 10)

; a.

; The maximum depth is 10, which is independent of n.


; b.

; total-pushes = 35n + 29