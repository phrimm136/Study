#lang sicp
(define (make-monitored f)
  (let ((called 0))
    (define (mf x)
      (cond ((eq? x 'how-many-calls?) called)
            ((eq? x 'reset-count) (set! called 0))
            ((number? x) (begin (set! called (inc called)) (f x)))
            (else (error "Invalid parameter" x))))
  mf))

(define s (make-monitored sqrt))

(s 100)
(s 'how-many-calls?)
(s 'reset-count)
(s 'how-many-calls?)