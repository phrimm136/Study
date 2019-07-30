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

(define (add-streams s1 s2)
  (stream-map + s1 s2))

(define (scale-stream stream factor)
  (stream-map (lambda (x) (* x factor)) stream))

(define (integral delayed-integrand initial-value dt)
  (define int
    (cons-stream initial-value
                 (let ((integrand (force delayed-integrand)))
                   (add-streams (scale-stream integrand dt)
                                int))))
  int)


(define ones (cons-stream 1 ones))

(define (solve-2nd f y0 dy0 dt)
  (let ((y nil) (dy nil) (ddy nil))
    (set! y (integral (delay dy) y0 dt))
    (set! dy (integral (delay ddy) dy0 dt))
    (set! ddy (stream-map f y dy))
    y))


(stream-ref (solve-2nd (lambda (y dy) (- y))  3.0 -0.5 0.00001) 100000)
; y`` + y = 0, y(0) = 3.0, y`(0) = -0.5 -> y = 3cos(x) - 0.5sin(x)
; 3cos(1) - 0.5sin(1) = 1.20017...

(stream-ref (solve-2nd (lambda (y dy) (+ (- y) 1)) 3.0 -0.5 0.00001) 100000)
; y`` + y = 1, y(0) = 3.0, y`(0) = -0.5 -> y = 2cos(x) - 0,5sin(x) + 1
; 2cos(1) - 0.5sin(1) + 1 = 1.65987...