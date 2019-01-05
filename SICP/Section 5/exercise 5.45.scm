#lang sicp
; a.

;; complexity of compiled version
; total pushes: 6n+1, maximum depths: 3n-1 (n >= 2)

;; ratio of complexity in compiled version to complexity in interpreted version
; total pushes: 3/16, maximum depths: 3/5

;; ratio of complexity in special-purpose version to complexity in interpreted version
; total pushed: 1/16, maximum depths: 2/5


; b.

; We can optimize our compiled code by using open-code compilation (exercise 5.38)