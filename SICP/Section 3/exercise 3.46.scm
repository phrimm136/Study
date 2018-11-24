#lang sicp
; When mutex fails by allowing two processs to acquire the mutex at the same time,

; Bank        Paul        Peter
; 100$
;             mutex-#f 
;                         mutex-#f
;             acquire 
;             -10         acquire
;             set to 90$  -20
; 90$         release     set to 80$
; 80$                     release