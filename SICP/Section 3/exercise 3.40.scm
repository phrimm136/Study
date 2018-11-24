#lang sicp
(#%require (planet "sicp-concurrency.ss" ("dyoo" "sicp-concurrency.plt" 1 2)))


(define x 10)
(parallel-execute (lambda () (set! x (* x x)))
                  (lambda () (set! x (* x x x))))
x

; 100 - (* 10 10 10) = 1000 -> (* 10 10) = 100 -> set to 1000 -> set to 100
; 1000 - (* 10 10) = 100 -> (* 10 10 10) = 1000 -> set to 100 -> set to 1000
; 10000 - (* 10 10) interleaved by (* 10 10 10) -> set to 1000 -> (* 10 1000) = 10000 -> set to 10000
;         (* 10 10 10) interleaved by (* 10 10) -> set to 100 -> (* 10 10 100) = 10000 -> set to 10000
; 100000 - (* 10 10 10) interleaved by (* 10 10) -> set to 100 -> (* 10 100 100) = 100000 -> set to 100000
; 1000000 - (* 10 10) = 100 -> set to 100 -> (* 100 100 100) = 1000000 -> set to 1000000
;           (* 10 10 10) = 1000 -> set to 1000 -> (* 1000 1000) = 1000000 -> set to 1000000


(define y 10)
(define s (make-serializer))
(parallel-execute (s (lambda () (set! y (* y y))))
                  (s (lambda () (set! y (* y y y)))))
y

; 1000000 - (* 10 10) = 100 -> set to 100 -> (* 100 100 100) = 1000000 -> set to 1000000
;           (* 10 10 10) = 1000 -> set to 1000 -> (* 1000 1000) = 1000000 -> set to 1000000