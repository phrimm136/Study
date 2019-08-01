#lang sicp
(define (rand-update x)
 (let ((m (expt 2 32))
       (a 1664525)
       (b 1013904423))
  (remainder (+ (* a x) b) m)))
; rand-update


(define rand
  (let ((x 1))
    (lambda () (set! x (rand-update x)) x)))
(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))


(define (square x) (* x x))


(define (estimate-integral P x1 x2 y1 y2 trials)
  (* (abs (* (- x2 x1) (- y2 y1))) (monte-carlo trials (P x1 x2 y1 y2))))
(define (circle x1 x2 y1 y2) (lambda ()
                               (<= (+ (square (- (random-in-range x1 x2) (/ (+ x1 x2) 2)))
                                      (square (- (random-in-range y1 y2) (/ (+ y1 y2) 2))))
                                   (if (< (- x2 x1) (- y2 y1))
                                       (square (/ 2 (- x2 x1)))
                                       (square (/ 2 (- y2 y1)))))))
(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0) (/ trials-passed trials))
          ((experiment) (iter (- trials-remaining 1) (+ trials-passed 1)))
          (else (iter (- trials-remaining 1) trials-passed))))
  (iter trials 0))


(estimate-integral circle -1.0 1.0 -1.0 1.0 10000000)