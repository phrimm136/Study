#lang sicp
(set! balance (+ balance 10)) ; Peter - 1
(set! balance (- balance 20)) ; Paul - 2
(set! balance (- balance (/ balance 2))) ; Mary - 3

; a: 45((1, 2, 3), (2, 1, 3)), 35((1, 3, 2)), 50((2, 3, 1)), 40((3, 1, 2), (3, 2, 1))

; b: bank      Peter      Paul      Mary
;    100$
;              100$       100$      100$
;                                   / 2
;                         -20$
;              +10$
;                                   50$
;    50$
;                         80$
;    80$
;              90$
;    90$
