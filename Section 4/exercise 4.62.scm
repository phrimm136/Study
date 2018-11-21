#lang sicp
(define (last-pair l)
  (if (null? (cdr l)) (car l) (last-pair (cdr l))))

; (rule (last-pair (?x) (?x)))
; (rule (last-pair (?u . ?v) (?x))
;   (last-pair ?v (?x)))

; (last-pair (3) ?x) -> (3)
; (last-pair (1 2 3) ?x) -> (3)
; (last-pair (2 ?x) (3)) -> (3)
; (last-pair ?x (3)) -> infinite cases