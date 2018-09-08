#lang sicp
(define (make-interval a b) (cons a b))
(define (lower-bound interval) (min (car interval) (cdr interval)))
(define (upper-bound interval) (max (car interval) (cdr interval)))

(define (make-center-percent center percent)
  (make-interval (* center (- 1 (/ percent 100))) (* center (+ 1 (/ percent 100)))))
(define (percent interval)
  (let ((up (upper-bound interval))
        (low (lower-bound interval)))
  (* (/ (- up low) (+ up low)) 100)))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))
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

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))
(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval one
                  (add-interval (div-interval one r1)
                                (div-interval one r2)))))

(div-interval (make-center-percent 50 0.1) (make-center-percent 50 0.1))
(div-interval (make-center-percent 50 0.) (make-center-percent 20 0.2))
(percent (div-interval (make-center-percent 50 0.1) (make-center-percent 50 0.1))) ; error bound doubled
(percent (div-interval (make-center-percent 50 0.) (make-center-percent 20 0.2)))
(percent (par1 (make-center-percent 50 0.1) (make-center-percent 20 0.2)))
(percent (par2 (make-center-percent 0.5 0.1) (make-center-percent 0.2 0.2)))

; In par1, there are three arithmetics on R_1 and R_2 which produce independent error bounds
; and increases the whole error bound (dependency problem)
; So Eva is right