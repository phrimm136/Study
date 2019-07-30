#lang sicp
(define k 40)
(define (cont-frac n d k)
  (define (cont-frac-recur i)
    (/ (n i) (+ (d i) (if (= k i) 0 (cont-frac-recur (+ i 1))))))
  (cont-frac-recur 1))

(define (euler-constant k)
  (+ (cont-frac (lambda (i) 1.0) (lambda (i) (if (= (remainder i 3) 2) (* 2 (+ 1 (/ i 3))) 1)) k) 2))

(euler-constant k)