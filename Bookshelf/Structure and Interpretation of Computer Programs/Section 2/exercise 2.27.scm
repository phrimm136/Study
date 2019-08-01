#lang sicp
(define x (list (list 1 2) (list 3 4)))

(define (reverse l)
  (define (iter l l-reverse)
    (if (null? (cdr l)) (cons (car l) l-reverse) (iter (cdr l) (cons (car l) l-reverse))))
  (iter l nil))
(reverse x)

(define (deep-reverse l)
  (define (deep-iter l l-reverse) (cons (if (pair? (car l)) (iter (car l) nil) (car l)) l-reverse))
  (define (iter l l-reverse)
    (if (null? (cdr l)) (deep-iter l l-reverse) (iter (cdr l) (deep-iter l l-reverse))))
  (iter l nil))
(deep-reverse x)