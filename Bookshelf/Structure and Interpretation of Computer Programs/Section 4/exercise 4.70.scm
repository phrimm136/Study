#lang sicp
(define (add-assertion! assertion)
  (store-assertion-in-index assertion)
  (set! THE-ASSERTIONS
        (cons-stream assertion THE-ASSERTIONS))
  'ok)

; It's because it can make infinite stream like ones without let binding.
; Setting THE-ASSERTIoNS like above makes THE-ASSERTIONS (stream assertion THE-ASSERTIONS), which THE-ASSERTIONS is not evaluated.
; So when we evaluate THE-ASSERTIONS, it invokes cons-stream over ans over, which causes infinite loop.