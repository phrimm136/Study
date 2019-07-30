#lang sicp

(define (make-vect xcor-vect ycor-vect) (cons xcor-vect ycor-vect))
(define (xcor-vect vect) (car vect))
(define (ycor-vect vect) (cdr vect))
(define (add-vect vect1 vect2) (make-vect (+ (xcor-vect vect1) (xcor-vect vect2))
                                          (+ (ycor-vect vect1) (ycor-vect vect2))))
(define (sub-vect vect1 vect2) (make-vect (- (car vect1) (car vect2)) (- (car vect2) (cdr vect2))))
(define (scale-vect scala vect) (cons (* scala (xcor-vect vect)) (* scala (ycor-vect vect))))


(define v1 (make-vect 1 2))
(define v2 (make-vect 3 4))
(define vsum (add-vect v1 v2))
(define vsub (sub-vect v1 v2))
(define vscl (scale-vect 3 v1))

v1
v2
vsum
vsub
vscl