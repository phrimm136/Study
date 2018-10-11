#lang sicp
(define (count-pairs x)
  (let ((encountered '()))
    (define (search x)
      (if (or (not (pair? x)) (memq x encountered))
          0
          (begin (set! encountered (cons x encountered))
                 (+ (search (car x)) (search (cdr x)) 1))))
    (search x)))


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
(count-pairs l2) ; 3
(count-pairs l3) ; 3
(count-pairs l4) ; 3