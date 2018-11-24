#lang sicp
(define (a-pythagorean-triple-starting-from low)
  (let ((i (an-integer-starting-from low)))
    (let ((j (an-integer-starting-from i)))
      (let ((k (an-integer-starting-from j)))
        (require (= (+ (* i i) (* j j)) (* k k)))
        (list i j k)))))

; Because of a lack of limitation and depth-first strategy, it never completed.

(define (a-pythagorean-triple-between low high)
  (let ((k (an-integer-starting-from low)))
    (let ((i (an-integer-between low k)))
      (let (j (an-integer-between i k)))
        (require (= (+ (* i i) (* j j)) (* k k)))
        (list i j k))))