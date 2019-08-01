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


(display-stream (pairs integers integers))

;       1   2   3   4   5   6   7   8   9  10 ...   100
;    |------------------------------------------- -----
; 1  |  1   2   4   6   8  10  12  14  16  18 ...   198 -- 2
; 2  |      3   5   9  13  17  21  25  29  33 ...   393 -- 4
; 3  |          7  11  19  27  35  43  51  59 ...   779 -- 8
; 4  |             15  23  39  55  71  87 103 ...  1543 -- 16
; 5  |                 31  47  79 111 143 175 ...  3055 -- 32
; 6  |                     63  95 159 223 287 ...  6047 -- 64
; 7  |                        127 191 319 447 ... 11967 -- 128
; 8  |                            255 383 639 ... 23679 -- 256
; 9  |                                511 767 ... 46847 -- 512
; 10 |                                   1023 ... 92671 -- 1024
; .  |                                        .
; .  |                                         .
; .  |                                          .
; 100|                                            2^100 - 1

; In (n, m),
; n = m: 2^n - 1
; n < m: (m-n) * 2^n - 1 + 2^(n-1)