#lang sicp
(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

; (n f) means n times of f.


; (add-1 zero)
; (lambda (f) (lambda (x) (f ((zero f) x))))
; (lambda (f) (lambda (x) (f (((lambda (f_) (lambda (x_) x_)) f) x))))
; (lambda (f) (lambda (x) (f ((lambda (f) f) x))))
; (lambda (f) (lambda (x) (f x)))

(define one (lambda (f) (lambda (x) (f x))))

; (add-1 one)
; (lambda (f) (lambda (x) (f ((one f) x))))
; (lambda (f) (lambda (x) (f (((lambda (f_) (lambda (x_) (f_ x_))) f) x))))
; (lambda (f) (lambda (x) (f ((lambda (x_) (f x_)) x))))
; (lambda (f) (lambda (x) (f (f x))))

(define two (lambda (f) (lambda (x) (f (f x)))))

(define (add m n)
 (lambda (f) (lambda (x) ((m f) ((n f) x)))))


((one inc) 2)
(((add one one) inc) 2)