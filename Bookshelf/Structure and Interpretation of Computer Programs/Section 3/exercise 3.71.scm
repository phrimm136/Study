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


(define (cube x) (* x x x))
(define (cube-sum x)
  (+ (cube (car x)) (cube (cadr x))))

(define (ramanujan-number pairs)
  (define (stream-cadr pairs) (stream-car (stream-cdr pairs)))
  (if (= (cube-sum (stream-car pairs)) (cube-sum (stream-cadr pairs)))
      (cons-stream (list (cube-sum (stream-car pairs)) (stream-car pairs) (stream-cadr pairs))
                   (ramanujan-number (stream-cdr pairs)))
      (ramanujan-number (stream-cdr pairs))))

(display-stream (ramanujan-number (weighted-pairs integers integers cube-sum)))
; 1729 (1 12) (9 10)
; 4104 (2 16) (9 15)
; 13832 (2 24) (18 20)
; 20683 (10 27) (19 24)
; 32832 (4 32) (18 30)
; 39312 (2 34) (15 33)