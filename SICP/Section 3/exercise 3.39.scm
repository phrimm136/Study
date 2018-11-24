#lang sicp
(#%require (planet "sicp-concurrency.ss" ("dyoo" "sicp-concurrency.plt" 1 2)))


(define x 10)
(define s (make-serializer))

(parallel-execute (lambda () (set! x ((s (lambda () (* x x))))))
                  (s (lambda () (set! x (+ x 1)))))
x
; 121 - (+ 10 1) = 11 -> set to 11 -> (* 11 11) = 121 -> set to 121
; 101 - (* 10 10) = 100 -> set to 100 -> (+ 100 1) = 101 -> set to 101
; 100 - (+ 10 1) = 11 -> (* 10 10) = 100 -> set to 11 -> set to 100
; 11 - (* 10 10) = 100 -> (+ 10 1) = 11 -> set to 100 -> set to 11