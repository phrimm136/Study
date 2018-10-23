#lang sicp
 (define (accept-action-procedure! proc)
   (set! action-procedures (cons proc action-procedures)))

; Without initialization, the added action procedures won't apply after-delay,
; every procedure won't be recorded on agenda, and the propagate will simulate nothing.