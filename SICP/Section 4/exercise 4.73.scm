#lang sicp
(define (flatten-stream stream)
  (if (stream-null? stream)
      the-empty-stream
      (interleave (stream-car stream)
                  (flatten-stream (stream-cdr stream)))))

; As said in exercise 4.71, it can't handle infinite stream.