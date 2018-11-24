#lang sicp
(define (evaln exp env)
  (cond ((self-evaluating? exp) exp)
        ((variable? exp) (lookup-variable-value exp env))
        ((quoted? exp) (text-of-quotation exp))
        ((assignment? exp) (eval-assignment exp env))
        ((definition? exp) (eval-definition exp env))
        ((if? exp) (eval-if exp env))
        ((lambda? exp) (make-procedure (lambda-parameters exp) (lambda-body exp) env))
        ((begin? exp) (eval-sequence (begin-actions exp) env))
        ((cond? exp) (evaln (cond->if exp) env))
        ((let? exp) (evaln (let->combination exp) env))
        ((let*? exp) (evaln (let*->nested-lets exp) env)) ; enough.
        ((do? exp) (evaln (do->combination exp) env))
        ((for? exp) (evaln (for->combination exp) env))
        ((while? exp) (evaln (while->combination exp) env))
        ((until? exp) (evaln (until-combination exp) env))
        ((application? exp) (apply (evaln (operator exp) env) (list-of-values (operands exp) env)))
        (else (error "Unknown expression type -- EVAL" exp))))

; (do
;   (while/until <cond>
;     <body>)
(define (do? exp)
  (tagged-list? exp 'do))

(define (loop exp) (cdr exp))
(define (do-body exp) (cddr exp))
(define (do->combination exp)
  (make-begin (append (sequence->exp (do-body exp)) (loop exp))))

; (for <first> <last> <do>
;   <body>)
(define (for? exp)
  (tagged-list? exp 'for))

(define (for-first exp) (cadr exp))
(define (for-last exp) (caddr exp))
(define (for-do exp) (cadr (cddr exp)))
(define (for-body exp) (caddr (cddr exp)))
(define (for->combination exp env)
  (let (for-name (gensym 'for))
    (list 'let
          for-name
          (list (for-first exp))
          (make-if (for-last exp)
                   (make-begin (append (sequence->exp (for-body exp)) (list (list for-name (for-do exp)))))
                   'done))))

; (while <cond>
;   <body>)
(define (while? exp)
  (tagged-list? exp 'while))

(define (while-cond exp) (cadr exp))
(define (while-body exp) (caddr exp))
(define (while->combination exp)
  (make-if (while-cond exp)
           (make-begin (append (sequence->exp (while-body exp)) exp))
           'done))

; (until <cond>
;   <body>)
(define (until? exp)
  (tagged-list? exp 'until))

(define (until-cond exp) (cadr exp))
(define (until-body exp) (caddr exp))
(define (until->combination exp)
  (make-if (until-cond exp)
           'done
           (make-begin (append (sequence->exp (until-body exp)) exp))))