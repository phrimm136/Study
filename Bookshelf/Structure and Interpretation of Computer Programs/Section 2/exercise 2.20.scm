#lang sicp
(define (same-parity x . y)
  (define (same? element) (= (remainder x 2) (remainder element 2)))
  (define (recursion list)
    (if (null? list)
        list
        (if (same? (car list))
            (cons (car list) (recursion (cdr list)))
            (recursion (cdr list)))))
    (recursion y))

(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7)