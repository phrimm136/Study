#lang sicp
(define k 10)
(define (cont-frac n d k)
  (define (cont-frac-recur i)
    (/ (n i) (+ (d i) (if (= k i) 0 (cont-frac-recur (+ i 1))))))
  (cont-frac-recur 1))

(define (tan-cf x k)
  (cont-frac (lambda (i) (if (= i 1) x (- (* x x)))) (lambda (i) (- (* 2 i) 1)) k))

(tan-cf 3.1415926535897932384626433832795 k)