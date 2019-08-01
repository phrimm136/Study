#lang sicp
(define (lexical-address-lookup address cmpl-tm-env)
  (let ((value (list-ref (list-ref cmpl-tm-env (address-frame address)) (address-offset address))))
    (if (eq? value '*unassigned)
        (error "Attempt to use variable before assignment")
        value)))

(define (lexical-address-set! address cmpl-tm-env new-value)
  (define (set-value! offset frame)
    (cond ((null? frame) (error "Segmentation fault" offset frame))
          ((= offset 0) (set-car! frame new-value))
          (else (set-value! (- offset 1) (cdr frame)))))
  (let ((frame (list-ref (cmpl-tm-env (address-frame address)))))
    (set-value! (address-offset address) frame)))

(define (address-frame address) (car address))
(define (address-offset address) (cdr address))
(define (make-address frame offset) (cons frame offset))