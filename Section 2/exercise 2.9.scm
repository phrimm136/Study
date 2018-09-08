#lang sicp
(define (make-interval a b) (cons a b))
(define (lower-bound interval) (min (car interval) (cdr interval)))
(define (upper-bound interval) (max (car interval) (cdr interval)))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))
(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))
(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))
(define (div-interval x y)
  (mul-interval x
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))

; width of sum of (a, b) and (c, d) = ((d + b) + (c + a)) / 2
;                                   = ((d + c) + (b + a)) / 2
;                                   = (d + c) / 2 + (b + a) / 2
; width of differnce of (a, b) and (c, d) = ((d - a) + (c - b)) / 2
;                                         = ((d + c) - (b + a)) / 2
;                                         = (d + c) / 2 - (b + a) / 2

; width of mul of (0, 2) and (1, 3) is 3 (2 * 3 - 0 * 1), not equal to 1 * 1.5, mul of the widths of each interval