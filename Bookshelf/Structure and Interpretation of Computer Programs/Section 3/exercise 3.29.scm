#lang sicp
(define (inverter input output)
  (define (invert-input)
    (let ((new-value (logical-not (get-signal input))))
      (after-delay inverter-delay (lambda () (set-signal! output new-value)))))
  (add-action! input invert-input)
  'ok)

(define (and-gate a1 a2 output)
  (define (and-action-procedure)
    (let ((new-value (logical-and (get-signal a1) (get-signal a2))))
      (after-delay and-gate-delay (lambda () (set-signal! output new-value)))))
  (add-action! a1 and-action-procedure)
  (add-action! a2 and-action-procedure)
  'ok)

(define (or-gate o1 o2 output)
  (define (or-action-procedure)
    (let ((!o1 (make-wire)) (!o2 (make-wire)) (!o1&!o2 (make-wire)))
      (inverter o1 !o1)
      (inverter o2 !o2)
      (and-gate !o1 !o2 !o1&!o2)
      (inverter !o1&!o2 output)))
  (add-action! o1 or-action-procedure)
  (add-action! o2 or-action-procedure)
  'ok)

; or-gate-delay = 2 * inverter-delay + and-gate-delay