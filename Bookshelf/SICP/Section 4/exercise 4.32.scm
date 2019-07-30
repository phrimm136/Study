#lang sicp
; Streams cannot make self-refering on car - (define y (cons-stream <some processing on y> <else>))
; but lazy lists can.
; We can use extra laziness to simulate circuit more simply.