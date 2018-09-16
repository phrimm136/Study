#lang sicp

(define (make-vect xcor-vect ycor-vect) (cons xcor-vect ycor-vect))
(define (xcor-vect vect) (car vect))
(define (ycor-vect vect) (cdr vect))
(define (add-vect vect1 vect2) (make-vect (+ (xcor-vect vect1) (xcor-vect vect2))
                                          (+ (ycor-vect vect1) (ycor-vect vect2))))
(define (sub-vect vect1 vect2) (make-vect (- (car vect1) (car vect2)) (- (car vect2) (cdr vect2))))
(define (scale-vect scala vect) (cons (* scala (xcor-vect vect)) (* scala (ycor-vect vect))))

(define (make-frame1 origin edge1 edge2)
  (list origin edge1 edge2))
(define (origin-frame1 frame)
  (car frame))
(define (edge1-frame1 frame)
  (cadr frame))
(define (edge2-frame1 frame)
  (caddr frame))
(define (make-frame2 origin edge1 edge2)
  (cons origin (cons edge1 edge2)))
(define (origin-frame2 frame)
  (car frame))
(define (edge1-frame2 frame)
  (cadr frame))
(define (edge2-frame2 frame)
  (cddr frame))

(define f1 (make-frame1 (make-vect 0 0) (make-vect 1 1) (make-vect -1 1)))
(define f2 (make-frame2 (make-vect 0 0) (make-vect 1 1) (make-vect -1 1)))

f1
f2
(edge2-frame1 f1)
(edge2-frame2 f2)