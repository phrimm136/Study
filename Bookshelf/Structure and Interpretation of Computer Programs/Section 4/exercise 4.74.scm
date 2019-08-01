#lang sicp
(define (stream-flatmap proc s)
  (flatten-stream (stream-map proc s)))
(define (flatten-stream stream)
  (if (stream-null? stream)
      the-empty-stream
      (interleave-delayed (stream-car stream)
                          (delay (flatten-stream (stream-cdr stream))))))


(define (simple-stream-flatmap proc s)
  (simple-flatten (stream-map proc s)))
(define (simple-flatten stream)
  (stream-map stream-car
              (stream-filter (lambda (stream) (not (stream-null? stream))) stream)))


; Because interleave procedure doesn't affect the order of stream, the query system's behavior is same.