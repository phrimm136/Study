#lang sicp
;; complexity of compiled version
; total pushes: 10*Fib(n+1)-3, maximum depths: 3n-1

;; ratio of complexity in compiled version to complexity in interpreted version
; total pushes: approximately 5/28, maximum depths: 3/5

;; ratio of complexity in special-purpose version to complexity in interpreted version
; total pushed: approximately 1/14, maximum depths: 2/5