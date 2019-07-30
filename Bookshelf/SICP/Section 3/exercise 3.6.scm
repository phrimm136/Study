#lang sicp
(define (rand-update x)
 (let ((m (expt 2 32))
       (a 1664525)
       (b 1013904423))
  (remainder (+ (* a x) b) m)))


(define rand
  (let ((x 1))
    (define (generate) (set! x (rand-update x)) x)
    (define (reset) (lambda (value) (set! x value) x))
    (define (dispatch op)
      (cond ((eq? op 'generate) (generate))
            ((eq? op 'reset) (reset))
            (else (error "Invalid operation" op))))
    dispatch))


(rand 'generate)
(rand 'generate)
(rand 'generate)
((rand 'reset) 2)
(rand 'generate)
(rand 'generate)
(rand 'blah)