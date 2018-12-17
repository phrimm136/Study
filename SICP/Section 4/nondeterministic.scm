#lang sicp
(define (ambevaln exp env succeed fail)
  ((analyze exp) env succeed fail))
(define (analyze exp)
  (cond ((self-evaluating? exp) (analyze-self-evaluating exp))
        ((variable? exp) (analyze-variable exp))
        ((quoted? exp) (analyze-quoted exp))
        ((assignment? exp) (analyze-assignment exp))
        ((permanent-set? exp) (analyze-permanent-set exp))
        ((definition? exp) (analyze-definition exp))
        ((if? exp) (analyze-if exp))
        ((if-fail? exp) (analyze-if-fail exp))
        ((lambda? exp) (analyze-lambda exp))
        ((begin? exp) (analyze-sequence (begin-actions exp)))
        ((cond? exp) (analyze (cond->if exp)))
        ((let? exp) (analyze (let->combination exp)))
        ((amb? exp) (analyze-amb exp))
        ((ramb? exp) (analyze-ramb exp))
        ((require? exp) (analyze-require exp))
        ((application? exp) (analyze-application exp))
        (else (error "Unknown expression type -- EVAL" exp))))


(define apply-in-underlying-scheme apply)


(define (analyze-self-evaluating exp)
  (lambda (env succeed fail) (succeed exp fail)))

(define (analyze-quoted exp)
  (let ((qval (text-of-quotation exp)))
    (lambda (env succeed fail) (succeed qval fail))))

(define (analyze-variable exp)
  (lambda (env succeed fail) (succeed (lookup-variable-value exp env) fail)))

(define (analyze-assignment exp)
  (let ((var (assignment-variable exp))
        (vproc (analyze (assignment-value exp))))
    (lambda (env succeed fail)
      (vproc env
             (lambda (val fail2)
               (let ((old-value (lookup-variable-value var env)))
                 (set-variable-value! var val env)
                 (succeed 'ok
                          (lambda ()
                            (set-variable-value! var old-value env)
                            (fail2)))))
             fail))))

(define (analyze-permanent-set exp)
  (let ((var (assignment-variable exp))
        (vproc (analyze (assignment-value exp))))
    (lambda (env succeed fail)
      (vproc env
             (lambda (val fail2)
               (set-variable-value! var val env)
               (succeed 'ok fail2))
             fail))))

(define (analyze-definition exp)
  (let ((var (definition-variable exp))
        (vproc (analyze (definition-value exp))))
    (lambda (env succeed fail)
      (vproc env
             (lambda (val fail2)
               (define-variable! var val env)
               (succeed 'ok fail2))
             fail))))

(define (analyze-if exp)
  (let ((pproc (analyze (if-predicate exp)))
        (cproc (analyze (if-consequent exp)))
        (aproc (analyze (if-alternative exp))))
    (lambda (env succeed fail)
      (pproc env
             (lambda (pred-value fail2)
               (if (true? pred-value)
                   (cproc env succeed fail2)
                   (aproc env succeed fail2)))
             fail))))

(define (analyze-if-fail exp)
  (let ((test (analyze (get-test exp)))
        (nope (analyze (get-fail exp))))
    (lambda (env succeed fail)
      (test env
            (lambda (val fail2) (succeed val fail2))
            (lambda () (nope env succeed fail))))))

(define (analyze-lambda exp)
  (let ((vars (lambda-parameters exp))
        (bproc (analyze-sequence (lambda-body exp))))
    (lambda (env succeed fail) (succeed (make-procedure vars bproc env) fail))))

(define (analyze-sequence exps)
  (define (sequentially proc1 proc2)
    (lambda (env succeed fail)
      (proc1 env
             (lambda (proc1-value fail2)
               (proc2 env succeed fail2))
             fail)))
  (define (loop first-proc rest-procs)
    (if (null? rest-procs)
        first-proc
        (loop (sequentially first-proc (car rest-procs))
              (cdr rest-procs))))
  (let ((procs (map analyze exps)))
    (if (null? procs)
        (error "Empty sequence -- ANALYZE"))
    (loop (car procs) (cdr procs))))

(define (analyze-amb exp)
  (let ((cproc (map analyze (amb-choices exp))))
    (lambda (env succeed fail)
      (define (try-next choices)
        (if (null? choices)
            (fail)
            ((car choices) env
                           succeed
                           (lambda () (try-next (cdr choices))))))
      (try-next cproc))))

(define (analyze-ramb exp)
  (let ((cproc (map analyze (ramb-list (ramb-contents exp) (length (ramb-contents exp))))))
    (lambda (env succeed fail)
      (define (try-next choices)
        (if (null? choices)
            (fail)
            ((car choices) env
                           succeed
                           (lambda () (try-next (cdr choices))))))
      (try-next cproc))))

(define (analyze-require exp)
  (let ((pproc (analyze (require-predicate exp))))
    (lambda (env succeed fail)
      (pproc env
             (lambda (pred-value fail2)
               (if (not pred-value)
                   (fail2)
                   (succeed 'ok fail2)))
             fail))))

(define (analyze-application exp)
  (let ((fproc (analyze (operator exp)))
        (aprocs (map analyze (operands exp))))
    (lambda (env succeed fail)
      (fproc env
             (lambda (proc fail2)
               (get-args aprocs
                         env
                         (lambda (args fail3)
                           (execute-application proc args succeed fail3))
                         fail2))
             fail))))

(define (get-args aprocs env succeed fail)
  (if (null? aprocs)
      (succeed '() fail)
      ((car aprocs) env
                    (lambda (arg fail2)
                      (get-args (cdr aprocs)
                                env
                                (lambda (args fail3)
                                  (succeed (cons arg args) fail3))
                                fail2))
                    fail)))

(define (execute-application proc args succeed fail)
  (cond ((primitive-procedure? proc) (succeed (apply-primitive-procedure proc args) fail))
        ((compound-procedure? proc) ((procedure-body proc) (extend-environment (procedure-parameters proc)
                                                                               args
                                                                               (procedure-environment proc))
                                                           succeed
                                                           fail))
        (else (error "Unknown procedure type -- EXECUTE-APPLICATION" proc))))


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


(define (permanent-set? exp)
  (tagged-list? exp 'permanent-set!))


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


(define (if-fail? exp)
  (tagged-list? exp 'if-fail))

(define (get-test exp) (cadr exp))
(define (get-fail exp) (caddr exp))


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


(define (amb? exp)
  (tagged-list? exp 'amb))

(define (amb-choices exp) (cdr exp))


(define (ramb? exp)
  (tagged-list? exp 'ramb))

(define (ramb-list exp n)
  (define (choose-iter exp n)
    (if (= n 1)
        (car exp)
        (choose-iter (cdr exp) (- n 1))))
  (define (exclude exp n)
    (if (= n 1)
        (cdr exp)
        (cons (car exp) (exclude (cdr exp) (- n 1)))))
  (if (= n 1)
      exp
      (let ((rand (+ (random (- n 1)) 1)))
        (cons (choose-iter exp rand)
              (ramb-list (exclude exp rand) (- n 1))))))

(define (ramb-contents exp) (cdr exp))


(define (require? exp) (tagged-list? exp 'require))

(define (require-predicate exp) (cadr exp))



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
        (list 'even? even?) (list 'odd? odd?)
        (list 'prime? (lambda (n)
                        (define (smallest-divisor n) (find-divisor n 2))
                        (define (find-divisor n test-divisor)
                          (cond ((> (* test-divisor test-divisor) n) n)
                                ((divides? test-divisor n) test-divisor)
                                (else (find-divisor n (+ test-divisor 1)))))
                        (define (divides? a b)
                          (= (remainder b a) 0))
                        (= n (smallest-divisor n))))
        (list 'square (lambda (x) (* x x))) (list 'cube (lambda (x) (* x x x))) (list 'sqrt sqrt)
        (list '+ +) (list '- -) (list '* *) (list '/ /) (list '> >) (list '< <)
        (list '= =) (list '> >) (list '< <) (list '>= >=) (list '<= <=)
        (list 'remainder remainder) (list 'modulo modulo) (list 'quotient quotient)
        (list 'abs abs) (list 'inc inc) (list 'dec dec)
        (list 'gcd gcd) (list 'lcm lcm)
        (list 'exp exp) (list 'expt expt) (list 'log log)
        (list 'sin sin) (list 'cos cos) (list 'tan tan)
        (list 'asin asin) (list 'acos acos) (list 'atan atan)
        (list 'floor floor) (list 'ceiling ceiling) (list 'truncate truncate) (list 'round round)
        (list 'map map) (list 'not not) (list 'eq? eq?) (list 'memq memq) (list 'member member)
        (list 'display display) (list 'newline newline)))
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
  (list 'procedure parameters body env))


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
            ((eq? var (car vars)) (car vals))
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
    (ambevaln '(define (an-element-of items)
                 (require (not (null? items)))
                 (amb (car items) (an-element-of (cdr items))))
              initial-env
              (lambda (val next-alternative) val)
              (lambda () 'failed))
    (ambevaln '(define (an-integer-starting-from n)
                 (amb n (an-integer-starting-from (+ n 1))))
              initial-env
              (lambda (val next-alternative) val)
              (lambda () 'failed))
    (ambevaln '(define (an-integer-between low high)
                 (require (<= low high))
                 (amb low (an-integer-between (+ low 1) high)))
              initial-env
              (lambda (val next-alternative) val)
              (lambda () 'falied))
    (ambevaln '(define (prime-sum-pair list1 list2)
                 (let ((a (an-element-of list1))
                       (b (an-element-of list2)))
                   (require (prime? (+ a b)))
                   (list a b)))
              initial-env
              (lambda (val next-alternative) val)
              (lambda () 'failed))
    ; Parsing natural language
    (ambevaln '(define nouns '(noun student professor cat class))
              initial-env
              (lambda (val next-alternative) val)
              (lambda () 'failed))
    (ambevaln '(define verbs '(verb studies lectures eats sleeps))
              initial-env
              (lambda (val next-alternative) val)
              (lambda () 'failed))
    (ambevaln '(define articles '(article the a))
              initial-env
              (lambda (val next-alternative) val)
              (lambda () 'failed))
    (ambevaln '(define prepositions '(prep for to in by with))
              initial-env
              (lambda (val next-alternative) val)
              (lambda () 'failed))
    (ambevaln '(define adjectives '(adj good passionate sleepy))
              initial-env
              (lambda (val next-alternative) val)
              (lambda () 'failed))
    (ambevaln '(define adverbs '(adv well deeply hard))
              initial-env
              (lambda (val next-alternative) val)
              (lambda () 'failed))
    (ambevaln '(define (parse-sentence) (list 'sentence (parse-noun-phrase) (parse-verb-phrase)))
              initial-env
              (lambda (val next-alternative) val)
              (lambda () 'failed))
    (ambevaln '(define (parse-noun-phrase)
                 (define (maybe-extend noun-phrase)
                   (amb noun-phrase
                        (maybe-extend (list 'noun-phrase noun-phrase (parse-prepositional-phrase)))))
                 (maybe-extend (parse-simple-noun-phrase)))
              initial-env
              (lambda (val next-alternative) val)
              (lambda () 'failed))
    (ambevaln '(define (parse-simple-noun-phrase)
                 (define (maybe-extend art-phrase)
                   (amb (list 'simple-noun-phrase art-phrase (parse-word nouns))
                        (list 'simple-noun-phrase art-phrase (parse-adjective-phrase))))
                 (maybe-extend (parse-word articles)))
              initial-env
              (lambda (val next-alternative) val)
              (lambda () 'failed))
    (ambevaln '(define (parse-verb-phrase)
                 (define (maybe-extend verb-phrase)
                   (amb verb-phrase
                        (maybe-extend (list 'verb-phrase verb-phrase (parse-prepositional-phrase)))))
                 (maybe-extend (parse-simple-verb-phrase)))
              initial-env
              (lambda (val next-alternative) val)
              (lambda () 'failed))
    (ambevaln '(define (parse-simple-verb-phrase)
                 (define (maybe-extend verb-phrase)
                   (amb verb-phrase
                        (list 'verb-phrase verb-phrase (parse-adverb-phrase))
                        (list 'verb-phrase (parse-adverb-phrase))))
                 (maybe-extend (parse-word verbs)))
              initial-env
              (lambda (val next-alternative) val)
              (lambda () 'failed))
    (ambevaln '(define (parse-prepositional-phrase) (list 'prep-phrase (parse-word prepositions) (parse-noun-phrase)))
              initial-env
              (lambda (val next-alternative) val)
              (lambda () 'failed))
    (ambevaln '(define (parse-adjective-phrase)
                 (amb (list 'adj-phrase (parse-word adjectives) (parse-word nouns))
                      (list 'adj-phrase (parse-adverb-phrase) (parse-word nouns))))
              initial-env
              (lambda (val next-alternative) val)
              (lambda () 'failed))
    (ambevaln '(define (parse-adverb-phrase)
                 (define (maybe-extend adv-phrase)
                   (amb adv-phrase
                        (maybe-extend (list 'adv-phrase adv-phrase (parse-word adjectives)))
                        (maybe-extend (list 'adv-phrase adv-phrase (parse-word verbs)))))
                 (maybe-extend (parse-word adverbs)))
              initial-env
              (lambda (val next-alternative) val)
              (lambda () 'failed))
    (ambevaln '(define (parse-word word-list)
                 (require (not (null? *unparsed*)))
                 (require (memq (car *unparsed*) (cdr word-list)))
                 (let ((found-word (car *unparsed*)))
                   (set! *unparsed* (cdr *unparsed*))
                   (list (car word-list) found-word)))
              initial-env
              (lambda (val next-alternative) val)
              (lambda () 'failed))
    (ambevaln '(define *unparsed* '())
              initial-env
              (lambda (val next-alternative) val)
              (lambda () 'failed))
    (ambevaln '(define (parse input)
                 (set! *unparsed* input)
                 (let ((sent (parse-sentence)))
                   (require (null? *unparsed*))
                   sent))              
              initial-env
              (lambda (val next-alternative) val)
              (lambda () 'failed))    
    initial-env))
(define the-global-environment (setup-environment))


(define input-prompt ";;; Amb-Eval input:")
(define output-prompt ";;; Amb-Eval value:")
(define (driver-loop)
  (define (internal-loop try-again)
    (prompt-for-input input-prompt)
    (let ((input (read)))
      (if (eq? input 'try-again)
          (try-again)
          (begin (newline)
                 (display ";;; Starting a new problem ")
                 (ambevaln input
                           the-global-environment
                           (lambda (val next-alternative)
                             (announce-output output-prompt)
                             (user-print val)
                             (internal-loop next-alternative))
                           (lambda ()
                             (announce-output ";;; There are no more values of")
                             (user-print input)
                             (driver-loop)))))))
  (internal-loop (lambda ()
                   (newline)
                   (display ";;; There is no current problem")
                   (driver-loop))))
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


(driver-loop)