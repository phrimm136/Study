#lang sicp
; Append this into analyze
((if-fail? exp) (analyze-if-fail exp))


(define (analyze-if-fail exp)
  (let ((test (analyze (get-test exp)))
        (nope (analyze (get-fail exp))))
    (lambda (env succeed fail)
      (test env
            (lambda (val fail2) (succeed val fail2))
            (lambda () (nope env succeed fail))))))


(define (if-fail? exp)
  (tagged-list? exp 'if-fail))

(define (get-test exp) (cadr exp))
(define (get-fail exp) (caddr exp))