#lang sicp
(define (conjoin conjuncts frame-stream)
  (if (empty-conjunction? conjuncts)
      frame-stream
      (merge-conjuncts (qeval (first-conjunct conjuncts) frame-stream)
                       (conjoin (rest-conjuncts conjuncts) frame-stream))))

(define (merge-conjuncts s1 s2)
  (cond ((stream-null? s1) s2)
        ((stream-null? s2) s1)
        (else (stream-flatmap (lambda (f1) (stream-flatmap (lambda (f2) (merge-frame f1 f2))
                                                           s2))
                              s1))))

(define (merge-frame f1 f2)
  (if (null? f1)
      (singleton-stream f2)
      (let ((binding (car f1)))
        (let ((united (assoc (car binding) f2)))
          (if united
              (if (equal? (cdr binding) (cdr united))
                  (merge-frame (cdr f1) f2)
                  the-empty-stream)
              (merge-frame (cdr f1) (cons binding f2)))))))
