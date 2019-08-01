#lang sicp
; (rule (outranked-by ?staff-person ?boss)
;       (or (supervisor ?staff-person ?boss)
;           (and (outranked-by ?middle-manager ?boss)
;                (supervisor ?staff-person ?middle-manager))))

; (outranked-by (Bitdiddle Ben) ?who)

; When we invoke outranked-by in (and), it applies with all case whose boss is ?boss.
; ?middle-manager is not bound, so its values are all people.
; But or of logical programming(make all conclusions with its condition and merge them) is not logical or(immediately return true if any statement is true)
; so it invokes outranked-by in (and) which even can be applied a case supervisor of ?staff-person is ?boss.
; Therefore, outranked-by make recursion without any condition and system goes into infinite loop.