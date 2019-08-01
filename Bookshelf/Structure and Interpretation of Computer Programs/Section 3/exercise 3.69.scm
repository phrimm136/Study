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


(define (divisible? x y) (= (remainder x y) 0))
(define (integers-starting-from n)
  (cons-stream n (integers-starting-from (+ n 1))))
(define integers (integers-starting-from 1))

(define (add-streams s1 s2)
  (stream-map + s1 s2))

(define (scale-stream stream factor)
  (stream-map (lambda (x) (* x factor)) stream))

(define (interleave s1 s2)
  (if (stream-null? s1)
      s2
      (cons-stream (stream-car s1)
                   (interleave s2 (stream-cdr s1)))))

(define (pairs s t)
  (cons-stream (list (stream-car s) (stream-car t))
               (interleave (stream-map (lambda (x) (list (stream-car s) x))
                                       (stream-cdr t))
                           (pairs (stream-cdr s) (stream-cdr t)))))


(define (triples s t u)
  (let ((pair (pairs t u)))
    (cons-stream (list (stream-car s) (stream-car t) (stream-car u))
                 (interleave (stream-map (lambda (x) (list (stream-car s) (car x) (cadr x)))
                                         (stream-cdr pair))
                             (triples (stream-cdr s) (stream-cdr t) (stream-cdr u))))))

(define (square x) (* x x))
(define (pythagorean? triple)
  (= (+ (square (car triple)) (square (cadr triple))) (square (caddr triple))))
(define (pythagorean-triples triples)
  (stream-filter (lambda (triple) (pythagorean? triple))
                 triples))

(display-stream (pythagorean-triples (triples integers integers integers)))
; (3 4 5) (6 8 10) (5 12 13) (9 12 15) (8 15 17) ...