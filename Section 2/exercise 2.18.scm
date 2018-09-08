#lang sicp
(define (reverse l)
  (define (iter l l-reverse)
    (if (null? (cdr l)) (cons (car l) l-reverse) (iter (cdr l) (cons (car l) l-reverse))))
  (iter l nil))

(reverse (list 1 4 9 16 25))