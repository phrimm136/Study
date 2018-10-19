#lang sicp
; 0,1 -> 1,1 -> 1,0

; Adding in queue: [set part1 to 1 , set part2 to 0]
; Adding in list: [set part2 to 0 , set part1 to 1]

; In queue version, the output of and-gate is set to 1 and then reset 0,
; while no value shift is detected in list version.

; It causes segments to be applicated by reverse order and related segments cannot be applicated.