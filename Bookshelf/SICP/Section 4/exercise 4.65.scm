#lang sicp
; (rule (wheel ?person)
;       (and (supervisor ?middle-manager ?person)
;            (supervisor ?x ?middle-manager)))

; (wheel ?who)
; ->
; (wheel (Warbucks Oliver))
; (wheel (Bitdiddle Ben))
; (wheel (Warbucks Oliver))
; (wheel (Warbucks Oliver))
; (wheel (Warbucks Oliver))

; Ben as middle-manager has three people to supervise and Eben has one person with same reason.
; In wheel, ?x and ?middle-manager are unbound, so there are four cases Oliver will be a wheel
; (Oliver->Ben-> Alyssa, Oliver->Ben->Cy, Oliver->Ben->Lem, Oliver->Eben->Robert).
; On the other hand, Ben has one case to be a wheel(Ben->Alyssa->Louis).