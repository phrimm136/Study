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

(define (merge-weighted s1 s2 weight)
  (cond ((stream-null? s1) s2)
        ((stream-null? s2) s1)
        (else (let ((s1car (stream-car s1))
                    (s2car (stream-car s2)))
                (cond ((< (weight s1car) (weight s2car)) (cons-stream s1car
                                                                      (merge-weighted (stream-cdr s1)
                                                                                      s2
                                                                                      weight)))
                      ((> (weight s1car) (weight s2car)) (cons-stream s2car
                                                                      (merge-weighted s1
                                                                                      (stream-cdr s2)
                                                                                      weight)))
                      (else (cons-stream s1car
                                         (cons-stream s2car
                                                      (merge-weighted (stream-cdr s1)
                                                                      (stream-cdr s2)
                                                                      weight)))))))))

(define (weighted-pairs s t weight)
  (cons-stream (list (stream-car s) (stream-car t))
               (merge-weighted (stream-map (lambda (x) (list (stream-car s) x))
                                           (stream-cdr t))
                               (weighted-pairs (stream-cdr s) (stream-cdr t) weight)
                               weight)))


(define (square x) (* x x))
(define (square-sum x)
  (+ (square (car x)) (square (cadr x))))

(define (triple-square-sum-numbers pairs)
  (define (stream-cadr pairs) (stream-car (stream-cdr pairs)))
  (define (stream-caddr pairs) (stream-car (stream-cdr (stream-cdr pairs))))
  (if (= (square-sum (stream-car pairs)) (square-sum (stream-cadr pairs)) (square-sum (stream-caddr pairs)))
      (cons-stream (list (square-sum (stream-car pairs))
                         (stream-car pairs) (stream-cadr pairs) (stream-caddr pairs))
                   (triple-square-sum-numbers (stream-cdr pairs)))
      (triple-square-sum-numbers (stream-cdr pairs))))

(display-stream (triple-square-sum-numbers (weighted-pairs integers integers square-sum)))
; 325 (1 18) (6 17) (10 15)
; 425 (5 20) (8 19) (13 16)
; 650 (5 25) (11 23) (17 19)
; 725 (7 26) (10 25) (14 23)
; 845 (2 29) (13 26) (19 22)