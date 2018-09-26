#lang sicp
; Tree for n=5
; (a b c d e) 31
;        │
;        ├───────────┐
;       e 16    (a b c d) 15
;                    │
;                    ├───────────┐
;                   d 8      (a b c) 7
;                                │
;                                ├───────────┐
;                               c 4       (a b) 3
;                                            │
;                                            ├───────────┐
;                                           b 2         a 1

; To encode the most frequent symbol it requires 1 bits.
; To encode the least frequent symbol it requires 4 bits.


; Tree for n=10
; (a b c d e f g h i j) 1023
;        │
;        ├───────────┐
;      j 512  (a b c d e f g h i) 511
;                    │
;                    ├───────────┐
;                  i 256  (a b c d e f g h) 255
;                                │
;                                ├───────────┐
;                              h 128  (a b c d e f g) 127
;                                            │
;                                            ├───────────┐
;                                           g 64  (a b c d e f) 63
;                                                        │
;                                                        ├───────────┐
;                                                       f 64  (a b c d e) 31
;                                                                    │
;                                                                    ├───────────┐
;                                                                   e 16    (a b c d) 15
;                                                                                │
;                                                                                ├────────┐
;                                                                               d 8   (a b c) 7
;                                                                                         │
;                                                                                         ├───────┐
;                                                                                        c 4   (a b) 3
;                                                                                                 │
;                                                                                                 ├─────┐
;                                                                                                b 2   a 1

; To encode the most frequent symbol it requires 1 bits.
; To encode the least frequent symbol it requires 9 bits.


; To encode the least frequent symbol in n symbols, it requires n-1 (n>=2) bits.