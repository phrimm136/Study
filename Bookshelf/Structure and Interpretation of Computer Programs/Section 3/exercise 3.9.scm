#lang sicp
(define (factorial n)
  (if (= n 1)
      1
      (* n (factorial (- n 1)))))

; Recursive version:

;           ┌─────────────────────────────────────────────────────────────────────────────────────────────────┐
;           │other variables                                                                                  │
; global -> │factorial:─┐                                                                                     │
; env       │           │                                                                                     │
;           └───────────┼─────────────────────────────────────────────────────────────────────────────────────┘
;                       │  ∧ 
;                       ∨  │
;                       ◎◎─┘
;                       ∨
;                       parameter: n
;                       body:(if (= n 1)
;                                1
;                                (* n (factorial (- n 1))))

; (factorial 6)
;           ┌─────────────────────────────────────────────────────────────────────────────────────────────────┐
;           │other variables                                                                                  │
; global -> │factorial                                                                                        │
; env       │                                                                                                 │
;           └─────────────────────────────────────────────────────────────────────────────────────────────────┘
;                 ∧         ∧         ∧        ∧         ∧        ∧         ∧
;               ┌───┐     ┌───┐     ┌───┐     ┌───┐     ┌───┐     ┌───┐     ┌───┐
;           E1->│n:6│ E2->│n:5│ E3->│n:4│ E4->│n:3│ E5->│n:2│ E6->│n:1│ E7->│n:0│
;               └───┘     └───┘     └───┘     └───┘     └───┘     └───┘     └───┘
;                           (if (= n 1) 1 (* n (factorial (- n 1))))


; (define (factorial n)
;   (fact-iter 1 1 n))
; (define (fact-iter product counter max-count)
;   (if (> counter max-count)
;       product
;       (fact-iter (* counter product)
;                  (+ counter 1)
;                  max-count)))

; Iterative Version

;           ┌─────────────────────────────────────────────────────────────────────────────────────────────────┐
;           │other variables                                                                                  │
; global -> │factorial:───────────────────────┐                                                               │
; env       │fact-iter:─┐                     │                                                               │
;           └───────────┼─────────────────────┼───────────────────────────────────────────────────────────────┘
;                       │  ∧                  │   ∧
;                       ∨  │                  ∨   │
;                       ◎◎─┘                  ◎◎─┘
;                       ∨                     ∨
;   parameters:product,counter,max-count     parameter:n
;   body:(if (> counter max-count)           body:(fact-iter 1 1 n)
;          product
;          (fact-iter (* counter product) (+ counter 1) max-count)))

; (factorial 6)
;           ┌─────────────────────────────────────────────────────────────────────────────────────────────────┐
;           │other variables                                                                                  │
; global -> │factorial                                                                                        │
; env       │fact-iter                                                                                        │
;           └─────────────────────────────────────────────────────────────────────────────────────────────────┘
;                 ∧         ∧           ∧           ∧           ∧           ∧          ∧           ∧
;               ┌───┐     ┌─────┐     ┌─────┐     ┌─────┐     ┌─────┐     ┌─────┐     ┌─────┐     ┌─────┐
;           E1->│n:6│ E2->│p:1  │ E3->│p:1  │ E4->│p:2  │ E5->│p:6  │ E6->│p:24 │ E7->│p:120│ E8->│p:720│
;               └───┘     │cnt:1│     │cnt:2│     │cnt:2│     │cnt:3│     │cnt:4│     │cnt:5│     │cnt:6│
;                         │max:6│     │max:6│     │max:6│     │max:6│     │max:6│     │max:6│     │max:6│
;                         └─────┘     └─────┘     └─────┘     └─────┘     └─────┘     └─────┘     └─────┘
;       (fact-iter 1 1 n)           (if (> counter max-count)
;                                        product
;                                       (fact-iter (* counter product) (+ counter 1) max-count)))