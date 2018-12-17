#lang sicp
(define apply-in-underlying-scheme apply)
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
        ((and? exp) (eval-and exp env))
        ((or? exp) (eval-or exp env))
        ((let? exp) (evaln (let->combination exp) env))
        ((let*? exp) (evaln (let*->nested-lets exp) env)) ; enough.
        ((letrec? exp) (evaln (letrec->let exp) env))
        ((application? exp) (applyn (evaln (operator exp) env) (list-of-values (operands exp) env)))
        (else (error "Unknown expression type -- EVAL" exp))))


(define (applyn procedure arguments)
  (cond ((primitive-procedure? procedure) (apply-primitive-procedure procedure arguments))
        ((compound-procedure? procedure) (eval-sequence (procedure-body procedure)
                                                        (extend-environment (procedure-parameters procedure)
                                                                            arguments
                                                                            (procedure-environment procedure))))
        (else (error "Unknown expression type -- APPLY" procedure))))

(define (list-of-values exps env)
  (if (no-operands? exps)
      '()
      (cons (evaln (first-operand exps) env)
            (list-of-values (rest-operands exps) env))))


(define (eval-if exp env)
  (if (true? (evaln (if-predicate exp) env))
      (evaln (if-consequent exp) env)
      (evaln (if-alternative exp) env)))

(define (eval-sequence exps env)
  (cond ((last-exp? exps) (evaln (first-exp exps) env))
        (else (evaln (first-exp exps) env)
              (eval-sequence (rest-exps exps) env))))

(define (eval-assignment exp env)
  (set-variable-value! (assignment-variable exp)
                       (evaln (assignment-value exp) env)
                       env)
  'ok)

(define (eval-definition exp env)
  (define-variable! (definition-variable exp)
    (evaln (definition-value exp) env)
    env)
  'ok)


(define (self-evaluating? exp)
  (cond ((number? exp) true)
        ((string? exp) true)
        (else false)))


(define (variable? exp) (symbol? exp))


(define (quoted? exp)
  (tagged-list? exp 'quote))

(define (text-of-quotation exp) (cadr exp))

(define (tagged-list? exp tag)
  (if (pair? exp)
      (eq? (car exp) tag)
      false))


(define (assignment? exp)
  (tagged-list? exp 'set!))

(define (assignment-variable exp) (cadr exp))
(define (assignment-value exp) (caddr exp))


(define (definition? exp)
  (tagged-list? exp 'define))

(define (definition-variable exp)
  (if (symbol? (cadr exp))
      (cadr exp)
      (caadr exp)))
(define (definition-value exp)
  (if (symbol? (cadr exp))
      (caddr exp)
      (make-lambda (cdadr exp)
                   (cddr exp))))


(define (lambda? exp) (tagged-list? exp 'lambda))

(define (lambda-parameters exp) (cadr exp))
(define (lambda-body exp) (cddr exp))

(define (make-lambda parameters body)
  (cons 'lambda (cons parameters body)))


(define (if? exp) (tagged-list? exp 'if))

(define (if-predicate exp) (cadr exp))
(define (if-consequent exp) (caddr exp))
(define (if-alternative exp)
  (if (not (null? (cdddr exp)))
      (cadddr exp)
      'false))

(define (make-if predicate consequent alternative)
  (list 'if predicate consequent alternative))


(define (begin? exp) (tagged-list? exp 'begin))

(define (begin-actions exp) (cdr exp))
(define (last-exp? seq) (null? (cdr seq)))
(define (first-exp seq) (car seq))
(define (rest-exps seq) (cdr seq))

(define (sequence->exp seq)
  (cond ((null? seq) seq)
        ((last-exp? seq) (first-exp seq))
        (else (make-begin seq))))
(define (make-begin seq) (cons 'begin seq))


(define (application? exp) (pair? exp))

(define (operator exp) (car exp))
(define (operands exp) (cdr exp))
(define (no-operands? ops) (null? ops))
(define (first-operand ops) (car ops))
(define (rest-operands ops) (cdr ops))


(define (cond? exp) (tagged-list? exp 'cond))

(define (cond-clauses exp) (cdr exp))
(define (cond-else-clause? clause)
  (eq? (cond-predicate clause) 'else))
(define (cond-predicate clause) (car clause))
(define (cond-actions clause) (cdr clause))
(define (cond->if exp)
  (expand-clauses (cond-clauses exp)))
(define (cond-recipient? clause) (eq? (cadr clause) '=>))
(define (cond-recipient clause) (caddr clause))
(define (expand-clauses clauses)
  (if (null? clauses)
      'false
      (let ((first (car clauses))
            (rest (cdr clauses)))
        (if (cond-else-clause? first)
            (if (null? rest)
                (sequence->exp (cond-actions first))
                (error "ELSE clause isn't last -- COND->IF" clauses))
            (make-if (cond-predicate first)
                     (if (cond-recipient? first)
                         (cons (cond-recipient first) (cond-predicate first))
                         (sequence->exp (cond-actions first)))
                     (expand-clauses rest))))))


(define (and-clauses exp) (cdr exp))
(define (or-clauses exp) (cdr exp))
(define (null-exp? exp) (null? exp))

(define (and? exp)
  (tagged-list? exp 'and))

(define (eval-and exp env)
  (if (null-exp? exp)
      false
      (let ((first (first-exp exp))
            (rest (rest-exps exp)))
        (cond ((last-exp? exp) first)
              (first (eval-and rest env))
              (else false)))))

(define (or? exp)
  (tagged-list? exp 'or))

(define (eval-or exp env)
  (if (null-exp? exp)
      false
      (let ((first (first-exp exp))
            (rest (rest-exps exp)))
        (cond ((last-exp? exp) first)
              (first true)
              (else (eval-or rest env))))))

(define (and->if exp)
  (expand-and-clauses (and-clauses exp)))
(define (expand-and-clauses exp)
  (let ((first (first-exp exp))
        (rest (rest-exps exp)))
    (cond ((null-exp? exp) false)
          ((last-exp? exp) first)
          (else (make-if (cond-predicate first)
                         (and->if rest)
                         false)))))
(define (or->if exp)
  (expand-clauses (or-clauses exp)))
(define (expand-or-clauses exp)
  (let ((first (first-exp exp))
        (rest (rest-exps exp)))
    (cond ((null-exp? exp) false)
          ((last-exp? exp) first)
          (else (make-if (cond-predicate first)
                         true
                         (or->if rest))))))


(define (let? exp)
  (tagged-list? exp 'let))

(define (let-variables clauses)
  (map car (car clauses)))
(define (let-expressions clauses)
  (map cadr (car clauses)))
(define (let-body clauses) (cdr clauses))

(define (named-let? exp) (and (let? exp) (symbol? (cadr exp))))

(define (named-let-variable clauses) (car clauses))
(define (named-let-parameters clauses)
  (define (iter bindings) 
    (if (null? bindings)
        nil
        (cons (caar bindings)
              (iter (cdr bindings)))))
  (iter (cadr clauses)))
(define (named-let-arguments clauses)
  (define (iter bindings)
    (if (null? bindings)
        nil
        (cons (cadar bindings)
              (iter (cdr bindings)))))
  (iter (cadr clauses)))
(define (named-let-body clauses) (cddr clauses))
(define (named-let->combination exp)
  (let ((clauses (cdr exp)))
    (make-begin (list (list 'define
                            (named-let-variable clauses)
                            (make-lambda (named-let-parameters clauses)
                                         (named-let-body clauses)))
                      (cons (named-let-variable clauses)
                            (named-let-arguments clauses))))))
(define (let->combination exp)
  (let ((clauses (cdr exp)))
    (if (named-let? clauses)
        (named-let->combination exp)
        (cons (make-lambda (let-variables clauses)
                           (let-body clauses))
              (let-expressions clauses)))))


(define (let*? exp)
  (tagged-list? exp 'let*))

(define (let*-null? clauses) (null? clauses))
(define (let*-expression clauses) (car clauses))
(define (let*-rest-expressions clauses) (cdr clauses))
(define (let*-body exp) (caddr exp))
(define (let*->nested-lets exp)
  (define (iter clauses)
    (if (let*-null? clauses)
        (sequence->exp (let*-body exp))
        (list 'let (list (let*-expression clauses)) (iter (let*-rest-expressions clauses)))))
  (iter (cadr exp)))


(define (letrec? exp) (tagged-list? exp 'letrec))

(define (letrec-variables exp) (map car (cadr exp)))
(define (letrec-expressions exp) (map cadr (cadr exp)))
(define (make-variables variables)
  (if (null? variables)
      nil
      (cons (list (car variables) ''*unattached)
            (make-variables (cdr variables)))))
(define (set-variables! variables expressions)
  (if (null? variables)
      nil
      (cons (list 'set! (car variables) (car expressions))
            (set-variables! (cdr variables) (cdr expressions)))))
(define (letrec-body exp) (cddr exp))
(define (letrec->let exp)
  (list 'let
        (make-variables (letrec-variables exp))
        (make-begin (append (set-variables! (letrec-variables exp) (letrec-expressions exp))
                            (letrec-body exp)))))


(define (true? x)
  (not (eq? x false)))
(define (false? x)
  (eq? x false))


(define (primitive-procedure? proc)
  (tagged-list? proc 'primitive))
(define (primitive-implementation proc) (cadr proc))
(define primitive-procedures
  (list (list 'car car) (list 'cdr cdr)
        (list 'caar caar) (list 'cadr cadr) (list 'cddr cddr)
        (list 'caaar caaar) (list 'caadr caadr) (list 'cdaar cdaar) (list 'cadar cadar)
        (list 'caddr caddr) (list 'cdadr cdadr) (list 'cddar cddar) (list 'cdddr cdddr)
        (list 'cons cons) (list 'list list)
        (list 'null? null?) (list 'pair? pair?) (list 'number? number?) (list 'string? string?)
        (list 'square (lambda (x) (* x x))) (list 'cube (lambda (x) (* x x x))) (list 'sqrt sqrt)
        (list '+ +) (list '- -) (list '* *) (list '/ /) (list '= =) (list '> >) (list '< <)
        (list 'remainder remainder) (list 'modulo modulo) (list 'quotient quotient)
        (list 'abs abs) (list 'inc inc) (list 'dec dec)
        (list 'gcd gcd) (list 'lcm lcm)
        (list 'exp exp) (list 'expt expt) (list 'log log)
        (list 'sin sin) (list 'cos cos) (list 'tan tan)
        (list 'asin asin) (list 'acos acos) (list 'atan atan)
        (list 'floor floor) (list 'ceiling ceiling) (list 'truncate truncate) (list 'round round)
        (list 'map map)))
(define (primitive-procedure-names)
  (map car primitive-procedures))
(define (primitive-procedure-objects)
  (map (lambda (proc) (list 'primitive (cadr proc))) primitive-procedures))

(define (apply-primitive-procedure proc args)
  (apply-in-underlying-scheme (primitive-implementation proc) args))


(define (compound-procedure? p)
  (tagged-list? p 'procedure))

(define (procedure-parameters p) (cadr p))
(define (procedure-body p) (caddr p))
(define (procedure-environment p) (cadddr p))

(define (make-procedure parameters body env)
  (list 'procedure parameters (scan-out-defines body) env))


(define (enclosing-environment env) (cdr env))
(define (first-frame env) (car env))
(define the-empty-environment '())
(define (make-frame variables values)
  (cons variables values))
(define (frame-variables frame) (car frame))
(define (frame-values frame) (cdr frame))
(define (add-binding-to-frame! var val frame)
  (set-car! frame (cons var (car frame)))
  (set-cdr! frame (cons val (cdr frame))))

(define (lookup-variable-value var env)
  (define (env-loop env)
    (define (scan vars vals)
      (cond ((null? vars) (env-loop (enclosing-environment env)))
            ((eq? var (car vars)) (if (eq? (car vals) '*unassigned*)
                                      (error "Variable is not yet assigned" (car vars))
                                      (car vals)))
            (else (scan (cdr vars) (cdr vals)))))
    (if (eq? env the-empty-environment)
        (error "Unbound variable" var)
        (let ((frame (first-frame env)))
          (scan (frame-variables frame)
                (frame-values frame)))))
  (env-loop env))

(define (extend-environment vars vals base-env)
  (if (= (length vars) (length vals))
      (cons (make-frame vars vals) base-env)
      (if (< (length vars) (length vals))
          (error "Too many arguments supplied" vars vals)
          (error "too few arguments supplied" vars vals))))
(define (define-variable! var val env)
  (let ((frame (first-frame env)))
    (define (scan vars vals)
      (cond ((null? vars) (add-binding-to-frame! var val frame))
            ((eq? var (car vars)) (set-car! vals val))
            (else (scan (cdr vars) (cdr vals)))))
    (scan (frame-variables frame)
          (frame-values frame))))
(define (set-variable-value! var val env)
  (define (env-loop env)
    (define (scan vars vals)
      (cond ((null? vars) (env-loop (enclosing-environment env)))
            ((eq? var (car vars)) (set-car! vals val))
            (else (scan (cdr vars) (cdr vals)))))
    (if (eq? env the-empty-environment)
        (error "Unbound variable -- SET!" var)
        (let ((frame (first-frame env)))
          (scan (frame-variables frame)
                (frame-values frame)))))
  (env-loop env))

(define (setup-environment)
  (let ((initial-env (extend-environment (primitive-procedure-names)
                                         (primitive-procedure-objects)
                                         the-empty-environment)))
    (define-variable! 'true true initial-env)
    (define-variable! 'false false initial-env)
    initial-env))
(define the-global-environment (setup-environment))


(define input-prompt ";;; M-Eval input:")
(define output-prompt ";;; M-Eval value:")
(define (driver-loop)
  (prompt-for-input input-prompt)
  (let ((input (read)))
    (let ((output (evaln input the-global-environment)))
      (announce-output output-prompt)
      (user-print output)))
  (driver-loop))
(define (prompt-for-input string)
  (newline) (newline) (display string) (newline))
(define (announce-output string)
  (newline) (display string) (newline))
(define (user-print object)
  (if (compound-procedure? object)
      (display (list 'compound-procedure
                     (procedure-parameters object)
                     (procedure-body object)
                     '<procedure-env>))
      (display object)))


(define (scan-out-defines proc)
  (let ((body-list proc))
    (define (internal-definition-variable body-list)
      (let ((body (car body-list))
            (rest (cdr body-list)))
        (cond ((eq? body-list nil) nil)
              ((definition? body) (cons (definition-variable body)
                                        (internal-definition-variable rest)))
              (else nil))))
    (define (internal-definition-value body-list)
      (let ((body (car body-list))
            (rest (cdr body-list)))
        (cond ((eq? body-list nil) nil)
              ((definition? body) (cons (definition-value body)
                                        (internal-definition-value rest)))
              (else nil))))
    (define (initial-variables variables)
      (if (null? variables)
          nil
          (cons (list (car variables) ''*unassigned*)
                (initial-variables (cdr variables)))))
    (define (set-variables! variables values)
      (if (null? variables)
          nil
          (cons (list 'set! (car variables) (car values))
                (set-variables! (cdr variables) (cdr values)))))
    (define (true-body body-list)
      (cond ((null? body-list) body-list)
            ((definition? (car body-list)) (true-body (cdr body-list)))
            (else body-list)))
    (let ((variables (internal-definition-variable body-list)))
      (if (null? variables)
          body-list
          (list (list 'let
                      (initial-variables variables)
                      (make-begin (append (set-variables! (internal-definition-variable body-list)
                                                          (internal-definition-value body-list))
                                          (true-body body-list)))))))))

(driver-loop)