#lang sicp
; 0,1 -> 1,1 -> 1,0

; Adding in queue: [set output to 1, set output to 0]
; Adding in list: [set output to 0, set output to 1]

; In queue version, the output of and-gate is set to 1 and then reset 0,
; while permanent shift is detected in list version.

; It causes segments to make not correct output.