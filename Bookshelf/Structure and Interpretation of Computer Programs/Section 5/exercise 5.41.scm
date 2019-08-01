#lang sicp
(define (find-variable value env)
  (let ((address (make-address 0 0)))
    (define (find-frame env)
      (cond ((null? env) 'not-found)
            ((member value (car env)) (find-offset (car env)))
            (else (set-car! address (+ (address-frame address) 1))
                  (find-frame (cdr env)))))
    (define (find-offset frame)
      (if (eq? value (car frame))
          address
          (begin (set-cdr! address (+ (address-offset address) 1))
                 (find-offset (cdr frame)))))
    (find-frame env)))