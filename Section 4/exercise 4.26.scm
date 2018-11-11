#lang sicp
; Ben's argument: When implementing if, we just passed non-evaluated expressions.
; So we can implement unless such way.

; Alyssa's argument: If unless or if is procedure, it could be argument of another procedure,
; but when we implemented if, evaluation on if was such a syntax (it didn't lookup in the environment).
; So if/unless is just a syntax.


(define (unless? exp) (tagged-list exp))

(define (unless-predicate exp) (cadr exp))
(define (unless-usual exp) (caddr exp))
(define (unless-exceptional exp)
  (if (not (null? (cdddr exp)))
      (cadddr exp)
      'false))
(define (unless->if exp)
  (make-if (not (unless-predicate exp))
           (unless-exceptional exp)
           (unless-usual exp)))


; Maybe it is useful to make unless a procedure when we apply serial control statement (with map).