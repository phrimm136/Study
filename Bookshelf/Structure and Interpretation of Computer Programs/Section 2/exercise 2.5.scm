#lang sicp
(define (search c divisor another-divisor)
  (define (logb b x) (/ (log x) (log b)))
  (define (iter c)
    (if (not (= (remainder c another-divisor) 0)) (logb divisor c) (iter (/ c another-divisor))))
  (iter c))

(define (my-cons a b)
  (* (expt 2 a) (expt 3 b)))
(define (my-car c)
  (search c 2 3))
(define (my-cdr c)
  (search c 3 2))

(my-car (my-cons 11 17))
(my-cdr (my-cons 11 17))