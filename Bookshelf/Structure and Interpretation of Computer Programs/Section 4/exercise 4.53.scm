#lang sicp
; (let ((pairs '()))
;   (if-fail (let ((p (prime-sum-pair '(1 3 5 8) '(20 35 110))))
;              (permanent-set! pairs (cons p pairs))
;              (amb))
;            pairs))

; -> ((8 35) (3 110) (3 20))

;    (3 20) -> permanent-set! -> amb == fail
; -> (3 100) -> permanent-set! -> amb == fail
; -> (8 35) -> permanent-set! -> amb == fail
; -> pairs == ((8 35) (3 110) (3 20))