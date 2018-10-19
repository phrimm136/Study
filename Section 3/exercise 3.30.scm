#lang sicp
(define (half-adder a b s c)
  (let ((d (make-wire)) (e (make-wire)))
    (or-gate a b d)
    (and-gate a b c)
    (inverter c e)
    (and-gate d e s)
    'ok))

(define (full-adder a b c-in sum c-out)
  (let ((s (make-wire)) (c1 (make-wire)) (c2 (make-wire)))
    (half-adder b c-in s c1)
    (half-adder a s sum c2)
    (or-gate c1 c2 c-out)
    'ok))

(define (ripple-carry-adder a-list b-list c s-list)
  (define (iter a-list b-list c-in s-list c-out)
    (if ((not null? a-list))
        (begin (full-adder (car a-list) (car b-list) c-in (car s-list) c-out)
               (iter (cdr a-list) (cdr b-list) c-in (cdr s-list) c-out))
        (set! c-out 0)))
  (iter a-list b-list c s-list c)
  'ok)

; delay of ripple-carry adder: n * (2 * (max delay of add-gate and or-gate) + 2 * delay of add-gate
;                                   delay of or-gate + 2 * delay of inverter)