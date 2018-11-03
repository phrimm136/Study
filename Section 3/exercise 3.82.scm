#lang sicp
(define (stream-car stream) (car stream))
(define (stream-cdr stream) (force (cdr stream)))

(define (stream-ref s n)
  (if (= n 0)
      (stream-car s)
      (stream-ref (stream-cdr s) (- n 1))))

(define (stream-map proc . argstreams)
  (if (stream-null? (car argstreams))
      the-empty-stream
      (cons-stream (apply proc (map stream-car argstreams))
                   (apply stream-map (cons proc (map stream-cdr argstreams))))))

(define (stream-for-each proc s)
  (if (stream-null? s)
      'done
      (begin (proc (stream-car s))
             (stream-for-each proc (stream-cdr s)))))

(define (display-stream s)
  (stream-for-each display-line s))
(define (display-line x)
  (newline)
  (display x))

(define (stream-enumerate-interval low high)
  (if (> low high)
      the-empty-stream
      (cons-stream low (stream-enumerate-interval (+ low 1) high))))

(define (stream-filter pred stream)
  (cond ((stream-null? stream) the-empty-stream)
        ((pred (stream-car stream)) (cons-stream (stream-car stream)
                                                 (stream-filter pred (stream-cdr stream))))
        (else (stream-filter pred (stream-cdr stream)))))

(define (integers-starting-from n)
  (cons-stream n (integers-starting-from (+ n 1))))
(define integers (integers-starting-from 1))

(define (add-streams s1 s2)
  (stream-map + s1 s2))

(define (scale-stream stream factor)
  (stream-map (lambda (x) (* x factor)) stream))

(define random-init 1)
(define (rand-update x)
  (let ((m (expt 2 32))
        (a 1664525)
        (b 1013904423))
    (remainder (+ (* a x) b) m)))

(define (square x) (* x x))

(define rand
  (cons-stream random-init
               (stream-map rand-update rand)))
(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))


(define (estimate-integral-stream P x1 x2 y1 y2)
  (scale-stream (monte-carlo-stream (P x1 x2 y1 y2) 0 0)
                (abs (* (- x2 x1) (- y2 y1)))))


(define (circle x1 x2 y1 y2) (lambda ()
                               (<= (+ (square (- (random-in-range x1 x2) (/ (+ x1 x2) 2)))
                                      (square (- (random-in-range y1 y2) (/ (+ y1 y2) 2))))
                                   (if (< (- x2 x1) (- y2 y1))
                                       (square (/ 2 (- x2 x1)))
                                       (square (/ 2 (- y2 y1)))))))

(define (monte-carlo-stream experiment pass fail)
  (define (chk pass fail)
    (cons-stream (/ pass (+ pass fail)) (monte-carlo-stream experiment pass fail)))
  (cond ((experiment) (chk (inc pass) fail))
        (else (chk pass (inc fail)))))


(stream-ref (estimate-integral-stream circle -1.0 1.0 -1.0 1.0) 1000000)