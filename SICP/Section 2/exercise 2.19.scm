#lang sicp
(define us-coins (list 10 5 1 25 50))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))
(define (list-length list)
  (if (null? list) 0 (+ 1 (list-length (cdr list)))))


(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
         (+ (cc amount
                (except-first-denomination coin-values))
            (cc (- amount
                   (first-denomination coin-values))
                coin-values)))))

(define no-more? (lambda (x) (null? x)))
(define (first-denomination list)
  (car list))
(define (except-first-denomination list)
  (cdr list))

(cc 100 us-coins)

; The order of the list coin-values doesn't affect the answer produced by cc.
; Because the procedure cc eventaully computes all possible cases.