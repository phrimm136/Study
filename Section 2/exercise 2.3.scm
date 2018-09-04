#lang sicp
(define (make-segment start end) (cons start end))
(define (start-segment seg) (car seg))
(define (end-segment seg) (cdr seg))

(define (make-point x y) (cons x y))
(define (x-point pair) (car pair))
(define (y-point pair) (cdr pair))

(define (make-rect bottom-left top-right) (cons bottom-left top-right))
(define (base-rectangle rect)
  (abs (- (x-point (end-segment rect)) (x-point (start-segment rect)))))
(define (height-rectangle rect)
  (abs (- (y-point (end-segment rect)) (y-point (start-segment rect)))))
(define (perimeter-rectangle base height)
  (* 2 (+ base height)))
(define (area-rectangle base height)
  (* base height))

(define rect (make-rectangle (make-point 0 0) (make-point 5 5)))
(define base (base-rectangle rect))
(define height (height-rectangle rect))

(perimeter-rectangle base height)
(area-rectangle base height)