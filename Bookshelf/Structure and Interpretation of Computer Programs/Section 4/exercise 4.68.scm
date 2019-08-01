#lang sicp
; (rule (append-to-form () ?y ?y))
; (rule (append-to-form (?u . ?v) ?y (?u . ?z))
;       (append-to-form ?v ?y ?z))


; (rule (reverse ?x ?x))
; (rule (reverse (?x . ?y) ?x)
;       (and (reverse ?y ?reversed)
;            (append-to-form ?reversed (?x) ?z)))