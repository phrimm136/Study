#lang sicp
; a.

(define (spread-arguments args)
  (let ((operand1 (first-operand args))
        (operand2 (first-operand (rest-operands args))))
    (let ((code1 (compile operand1 'arg1 'next))
          (code2 (compile operand2 'arg2 'next)))
      (preserving '(env)
                  code1
                  (append-instruction-sequences (if (modifies-register? code2 'arg1)
                                                    (append-instruction-sequences (make-instruction-sequence '(arg1)
                                                                                                             '()
                                                                                                             '((save arg1)))
                                                                                  code2
                                                                                  (make-instruction-sequence '()
                                                                                                             '(arg1)
                                                                                                             '((restore arg1))))
                                                    code2))))))


; b.

(define (compile exp target linkage)
  (cond ((self-evaluating? exp) (compile-self-evaluating exp target linkage))
        ((quoted? exp) (compile-quoted exp target linkage))
        ((variable? exp) (compile-variable exp target linkage))
        ((assignment? exp) (compile-assignment exp target linkage))
        ((definition? exp) (compile-definition exp target linkage))
        ((if? exp) (compile-if exp target linkage))
        ((lambda? exp) (compile-lambda exp target linkage))
        ((begin? exp) (compile-sequence (begin-actions exp) target linkage))
        ((cond? exp) (compile (cond->if exp) target linkage))
        ((open-code? exp) (compile-open-code exp target linkage))
        ((application? exp) (compile-application exp target linkage))
        (else (error "Unknown expression type -- COMPILE" exp))))


(define (open-code? exp)
  (memq (car exp) '(+ - * /)))

(define (compile-open-code exp target linkage)
  (let ((op (operator exp))
        (args (operands exp)))
    (end-with-linkage linkage
                      (append-instruction-sequences (spread-arguments args)
                                                    (make-instruction-sequence '(arg1 arg2)
                                                                               (list target)
                                                                               `((assign ,target (op ,op) (reg arg1) (reg arg2))))))))


; c.

(assign val (op make-compiled-procedure) (label entry1) (reg env))
(goto (label after-lambda2))
entry1
(assign env (op compiled-procedure-env) (reg proc))
(assign env (op extend-environment) (const (n)) (reg argl) (reg env))
(save continue)
(save env)
(assign proc (op lookup-variable-value) (const =) (reg env))
(assign val (const 1))
(assign argl (op list) (reg val))
(assign val (op lookup-variable-value) (const n) (reg env))
(assign argl (op cons) (reg val) (reg argl))
(test (op primitive-procedure?) (reg proc))
(branch (label primitive-branch6))
compiled-branch7
(assign continue (label after-call8))
(assign val (op compiled-procedure-entry) (reg proc))
(goto (reg val))
primitive-branch6
(assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call8
(restore env)
(restore continue)
(test (op false?) (reg val))
(branch (label false-branch4))
true-branch3
(assign val (const 1))
(goto (reg continue))
false-branch4
(save continue)
(save env)
(assign proc (op lookup-variable-value) (const factorial) (reg env))
(assign arg1 (op lookup-variable-value) (const n) (reg env))
(assign arg2 (const 1))
(assign val (op -) (reg arg1) (reg arg2))
(assign argl (op list) (reg val))
(test (op primitive-procedure?) (reg proc))
(branch (label primitive-branch9))
compiled-branch10
(assign continue (label proc-return12))
(assign val (op compiled-procedure-entry) (reg proc))
(goto (reg val))
proc-return12
(assign arg1 (reg val))
(goto (label after-call11))
primitive-branch9
(assign arg1 (op apply-primitive-procedure) (reg proc) (reg argl))
after-call11
(restore env)
(assign arg2 (op lookup-variable-value) (const n) (reg env))
(assign val (op *) (reg arg1) (reg arg2))
(restore continue)
(goto (reg continue))
after-if5
after-lambda2
(perform (op define-variable!) (const factorial) (reg val) (reg env))
(assign val (const ok))


; d.

(define (compile-open-code exp target linkage)
  (let ((op (operator exp))
        (args (operands exp)))
    (cond ((last-operand? args) (make-instruction-sequence '()
                                                           '(val)
                                                           `((assign ,target (const ,(car args))))))
          ((= (length args) 2) (end-with-linkage linkage
                                                 (append-instruction-sequences (spread-arguments args)
                                                                               (make-instruction-sequence '(arg1 arg2)
                                                                                                          (list target)
                                                                                                          `((assign ,target (op ,op) (reg arg1) (reg arg2)))))))
          ((and (> (length args) 2) (memq op '(+ *))) (end-with-linkage linkage
                                                                        (preserving '(env)
                                                                                    (compile (first-operand args) 'arg1 'next)
                                                                                    (preserving '(arg1)
                                                                                                (compile-open-code (append (list op) (rest-operands args)) 'arg2 linkage)
                                                                                                (make-instruction-sequence '(arg1 arg2)
                                                                                                                           (list target)
                                                                                                                           `((assign ,target (op ,op) (reg arg1) (reg arg2))))))))
          (else (error "Invalid operands -- COMPILE-OPEN-CODE" args)))))