#lang sicp
(define (unique pattern frame-stream)
  (stream-flatmap (lambda (frame)
                    (if (singleton? (qeval (negated-query pattern) (singleton-stream frame)))
                        (qeval (negated-query pattern) (singleton-stream frame))
                        the-empty-stream))
                  frame-stream))
(put 'unique 'qeval unique)
(define (singleton? stream)
  (and (not (stream-null? stream))
       (stream-null? (stream-cdr stream))))

(define (unique-query exps) (car exps))