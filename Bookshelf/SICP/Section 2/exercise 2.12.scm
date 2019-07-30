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

(define interval (make-center-percent 1 10))

interval
(percent interval)