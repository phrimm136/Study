#lang sicp
(define (a-pythagorean-triple-between low high)
  (let ((i (an-integer-between low high))
        (hsq (* high high)))
    (let ((j (an-integer-between i high)))
      (let ((ksq (+ (* i i) (* j j))))
        (require (>= hsq ksq))
        (let ((k (sqrt ksq)))
          (require (integer? k))
          (list i j k))))))

; Ben's procedure requires only two variables to amb, so it's time complexity is O(n^2), while the original version's is O(n^3).
; Also, it ignores many irrelevent results(a^2 + b^2 > c^2).
; It's efficient.