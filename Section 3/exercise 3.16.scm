#lang sicp
(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
         (count-pairs (cdr x))
         1)))


(define l1 '(a b c))

; l1──>a│──>b│──>c│/

(define x '(i))
(define y (cons x x))
(define l2 (list y))

; l2──> │/
;      └───> │ <───y
;           ├─┘
;           ∨
;       y──>i│/

(define z '(n))
(define w (cons z z))
(define l3 (cons w w))

; l3──> │
;      ├─┘
;      └───> │ <───w
;           ├─┘
;           ∨
;       z──>n│/

(define l4 '(x y z))
(set-cdr! (cddr l4) l4)

; l4──>x│──>y│──>z│┐
;      ∧           │
;      └───────────┘


(count-pairs l1) ; 3
(count-pairs l2) ; 4
(count-pairs l3) ; 7
(count-pairs l4) ; Infinite recursion