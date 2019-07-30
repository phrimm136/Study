#lang sicp
 (define k 11)
; (define (cont-frac n d k)
;   (define (cont-frac-recur i)
;     (/ (n i) (+ (d i) (if (= k i) 0 (cont-frac-recur (+ i 1))))))
;   (cont-frac-recur 1))

; (cont-frac (lambda (i) 1.0) (lambda (i) 1.0) k)

; recursive version (from 1 to k)

(define (cont-frac n d k)
  (define (cont-frac-iter i result)
    (if (not (< i 1)) (cont-frac-iter (- i 1) (/ (n i) (+ (d i) result))) result))
  (cont-frac-iter k 0))

(cont-frac (lambda (i) 1.0) (lambda (i) 1.0) k)

; iterative version (from k to 1)