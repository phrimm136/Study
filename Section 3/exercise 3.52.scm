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


(define sum 0)
(define (accum x)
  (set! sum (+ x sum))
  sum)
(define seq (stream-map accum (stream-enumerate-interval 1 20))) ; sum = 1
(define y (stream-filter even? seq)) ; sum = 1 + 2 + 3 = 6 - procedure is applied until the condition is false
(define z (stream-filter (lambda (x) (= (remainder x 5) 0)) seq)) ; sum = 6 + 4 = 10
(stream-ref y 7) ; sum = 10 + sigma 5 to 16 = 136 -> 136
(display-stream z)
; 10 15 45 55 105 120 190 210

; If there is no memoizing, duplicate values will be added to sum. 