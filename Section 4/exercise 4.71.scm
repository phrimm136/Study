#lang sicp
(define (simple-query query-pattern frame-stream)
  (stream-flatmap (lambda (frame)
                    (stream-append (find-assertions query-pattern frame)
                                   (apply-rules query-pattern frame)))
                  frame-stream))
(define (disjoin disjuncts frame-stream)
  (if (empty-disjunction? disjuncts)
      the-empty-stream
      (interleave (qeval (first-disjunct disjuncts) frame-stream)
                  (disjoin (rest-disjuncts disjuncts) frame-stream))))

; stream-append(-delay) and interleave(-delay) are procedures, so applying these procedures make its arguments evaluated due to applicative order.
; If we don't delay explicitly, argument streams are fully evaluated and this is not we intended - ex) infinite stream.