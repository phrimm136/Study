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

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define i (make-center-percent 50 1))
(define j (make-center-percent 20 2))

(percent (mul-interval i j))
;   (percent-i + percent-j - 1)
; + (10000 - (percent-i * percent-j * (percent-i + percent-j - 1))) / (10000 + percnet-i * percent-j)
; But (10000 - (percent-i * percent-j * (percent-i + percent-j - 1))) / (10000 + percnet-i * percent-j) is approximate to 1.
; -> (percent-i + percent-j)