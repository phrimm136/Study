#lang sicp
; a.

(define (lookup-variable-value var env)
  (define (env-loop env)
    (define (scan vars vals)
      (cond ((null? vars) (env-loop (enclosing-environment env)))
            ((eq? var (car vars)) (car vals)) ; *** changed
            (else (scan (cdr vars) (cdr vals)))))
    (if (eq? env the-empty-environment)
        false ; *** changed
        (let ((frame (first-frame env)))
          (scan (frame-variables frame)
                (frame-values frame)))))
  (env-loop env))
(define (unbound? var env)
  (eq? (lookup-variable-value var env) false))
(define (unassigned? var env)
  (eq? (lookup-variable-value var env) '*unassigned*))


unbound-variable
(restore continue)
(assign val (const unbound-variable-error))
(goto (label signal-error))

unassigned-variable
(restore continue)
(assign val (const unassigned-variable-error))
(goto (label signal-error))

signal-error
(perform (op user-print) (reg val))
(goto (label read-eval-print-loop))
    
ev-variable
(test (op unbound?) (reg exp) (reg env)) ; ***
(branch (label unbound-variable))
(test (op unassigned?) (reg exp) (reg env))
(branch (label unassigned-variable)) ; *** changed
(assign val (op lookup-variable-value) (reg exp) (reg env))
(goto (reg continue))

ev-assignment
(assign unev (op assignment-variable) (reg exp))
(test (op unbound?) (reg unev) (reg env)) ; ***
(branch (label unbound-variable)) ; *** changed
(save unev)
(assign exp (op assignment-value) (reg exp))
(save env)
(save continue)
(assign continue (label ev-assignment-1))
(goto (label eval-dispatch))
    
ev-assignment-1
(restore continue)
(restore env)
(restore unev)
(perform (op set-variable-value!) (reg unev) (reg val) (reg env))
(assign val (const ok))
(goto (reg continue))



; b.

(define (apply-primitive-procedure proc args)
  (let ((need-pairing-test (list (list 'primitive car) (list 'primitive cdr)))
        (need-zero-division-test (list 'primitive /)))
    (cond ((assoc proc need-pairing-test) (if (not (pair? args))
                                              'not-pair
                                              (apply-in-underlying-scheme (primitive-implementation proc) args)))
          ((equal? proc need-zero-division-test) (if (= (cadr args) 0)
                                                     'zero-division
                                                     (apply-in-underlying-scheme (primitive-implementation proc) args)))
          (else (apply-in-underlying-scheme (primitive-implementation proc) args)))))
(define (not-pair? val)
  (eq? val 'not-pair))
(define (zero-division? val)
  (eq? val 'zero-division))

; In eceval-operations,
(list 'not-pair? not-pair?)
(list 'zero-division? zero-division)

; In register-machine,
zero-division
(restore argl)
(assign val (const division-zero-error))
(goto (label signal-error))

not-pair
(restore continue)
(assign val (const not-pair-error))
(goto (label signal-error))

signal-error
(perform (op user-print) (reg val))
(goto (label read-eval-print-loop))


primitive-apply
(assign val (op apply-primitive-procedure) (reg proc) (reg argl))
(test (op not-pair?) (reg val))
(branch (label not-pair))
(test (op zero-division?) (reg val))
(branch (label zero-division))
(restore continue)
(goto (reg continue))
