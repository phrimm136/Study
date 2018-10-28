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


(define (merge s1 s2)
  (cond ((stream-null? s1) s2)
        ((stream-null? s2) s1)
        (else (let ((s1car (stream-car s1))
                    (s2car (stream-car s2)))
                (cond ((< s1car s2car) (cons-stream s1car (merge (stream-cdr s1) s2)))
                      ((> s1car s2car) (cons-stream s2car (merge (stream-cdr s2) s1)))
                      (else (cons-stream s1car (merge (stream-cdr s1) (stream-cdr s2)))))))))

(define S (cons-stream 1 (merge (merge (scale-stream integers 2) (scale-stream integers 3))
                                (scale-stream integers 5))))

(display-stream S) ; 1 2 3 4 5 6 8 9 10 12 14 15 16 18...