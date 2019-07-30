#lang sicp
(define (analyze exp)
  (cond ((self-evaluating? exp) (analyze-self-evaluating exp))
        ((variable? exp) (analyze-variable exp))
        ((quoted? exp) (analyze-quoted exp))
        ((assignment? exp) (analyze-assignment exp))
        ((definition? exp) (analyze-definition exp))
        ((if? exp) (analyze-if exp))
        ((lambda? exp) (analyze-lambda exp))
        ((begin? exp) (analyze-sequence (begin-actions exp)))
        ((cond? exp) (analyze (cond->if exp)))
        ((let? exp) (analyze (let->combination exp)))
        ((application? exp) (analyze-application exp))
        (else (error "Unknown expression type -- EVAL" exp))))


(define (let? exp)
  (tagged-list? exp 'let))

(define (let-variables clauses)
  (map car (car clauses)))
(define (let-expressions clauses)
  (map cadr (car clauses)))
(define (let-body clauses) (cdr clauses))
(define (let->combination exp)
  (let ((clauses (cdr exp)))
    (cons (make-lambda (let-variables clauses)
                       (let-body clauses))
          (let-expressions clauses))))

; Test at anal-eval-apply.
; (let ((a 3) (b 2)) (+ a b)) -> 5