#lang sicp
(car ''abracadabra) ; quote

; ''abracadabra is interpreted to (quote (quote abracadabra))
; The first quote quotes the next entity (quote abracadabra), which is a list with two elements.
; The second quote is not evaluated because it is quoted symbol, not procedure.
; So ''abracadabra is (quote abracadabra)