#lang sicp
 (define (accept-action-procedure! proc)
   (set! action-procedures (cons proc action-procedures)))

; Without initialization, the added action procedures won't apply after-delay,
; the agenda won't be filled, and the propagate will always print nothing but 'done.