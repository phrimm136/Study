#lang sicp
(#%require "sicp-concurrency.ss") ; for racket users, by dirty way

(define x 10)
(define s (make-serializer))

(parallel-execute (lambda () (set! x ((s (lambda () (* x x))))))
                  (s (lambda () (set! x (+ x 1)))))

x
; 121 - (+ x 1) -> 11 -> (* x x) -> 121
; 101 - (* x x) -> 100 -> (+ x 1) -> 101
; 100 - (+ x 1) -> 11, (* x x) -> 100
; 11 - (* x x) -> 100, (+ x 1) -> 11