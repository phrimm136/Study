#lang sicp
(defiene (an-integer-between low high)
  (require (<= low high))
  (amb (an-integer-between (+ low 1) high)))