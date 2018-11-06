#lang sicp
(define (run-forever) (run-forever))
(define (try p)
  (if (halts? p p)
      (run-forever)
      ('halted)))

; If try can halt, halts? is true and it should be halted, but run-forever invokes.
; If try can't halt, halts? is false and it should be lasted, but it halts.