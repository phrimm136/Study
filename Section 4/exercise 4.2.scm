#lang sicp
(define (eval exp env)
  (cond ((application? exp) (apply (eval (operator exp) env) (list-of-values (operands exp) env)))
        ((self-evaluating? exp) exp)
        ((variable? exp) (lookup-variable-value exp env))
        ((quoted? exp) (text-of-quotation exp))
        ((assignment? exp) (eval-assignment exp env))
        ((definition? exp) (eval-definition exp env))
        ((if? exp) (eval-if exp env))
        ((lambda? exp) (make-procedure (lambda-parameters exp) (lambda-body exp) env))
        ((begin? exp) (eval-sequence (begin-actions exp) env))
        ((cond? exp) (eval (cond->if exp) env))
        (else (error "Unknown expression type -- EVAL" exp))))

; Let application have first order.
; Every expression is pair, and application? produces always true with pairs.
; So all of clauses are evaluated as applications, and this is wrong evaluation.


; In eval,
((application? exp) (apply (apply-operator exp) env) (list-of-values (apply-operands exp) env)))

(define (application? exp)
  (tagged-list? exp 'call))
(define (apply-operator exp) (cadr exp))
(define (apply-operands exp) (cddr exp))
; 