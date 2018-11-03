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


(define (RLC-circuit R L C dt)
  (lambda (v_C0 i_L0)
    (let ((v_C nil) (i_L nil) (dv_C nil) (di_L nil))
      (set! v_C (integral (delay dv_C) v_C0 dt))
      (set! i_L (integral (delay di_L) i_L0 dt))
      (set! dv_C (scale-stream i_L (/ -1 C)))
      (set! di_L (add-streams (scale-stream v_C (/ 1 L))
                              (scale-stream i_L (/ (- R) L))))
      (cons v_C i_L))))


(define RLC1 (RLC-circuit 1 0.2 1 0.1))
(stream-ref (car (RLC1 0 10)) 1)
(stream-ref (cdr (RLC1 0 10)) 1)