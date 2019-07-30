#lang sicp
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp) (remainder (* (expmod base (/ exp 2) m) (expmod base (/ exp 2) m)) m))
        (else (remainder (* base (expmod base (- exp 1) m)) m))))

; (expmod base (/ esp 2) m) i computed twice at each step instead of once;
; hence, expmod does not halve the problem size at each step.