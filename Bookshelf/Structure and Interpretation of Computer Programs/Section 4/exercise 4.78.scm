#lang sicp
(define (make-table)
  (let ((local-table (list '*table*)))
    (define (lookup key-1 key-2)
      (let ((subtable (assoc key-1 (cdr local-table))))
        (if subtable
            (let ((record (assoc key-2 (cdr subtable))))
              (if record
                  (cdr record)
                  false))
            false)))
    (define (insert! key-1 key-2 value)
      (let ((subtable (assoc key-1 (cdr local-table))))
        (if subtable
            (let ((record (assoc key-2 (cdr subtable))))
              (if record
                  (set-cdr! record value)
                  (set-cdr! subtable (cons (cons key-2 value) (cdr subtable)))))
            (set-cdr! local-table
                      (cons (list key-1 (cons key-2 value)) (cdr local-table)))))
      'ok)
    (define (dispatch m)
      (cond ((eq? m 'lookup-in-database) lookup)
            ((eq? m 'insert-in-database!) insert!)
            (else (error "Unknown operation -- TABLE" m))))
    dispatch))

(define database (make-table))
(define get (database 'lookup-in-database))
(define put (database 'insert-in-database!))
; get/put


(define (ambevaln exp succeed fail frame)
  ((analyze exp frame) succeed fail))
(define (analyze exp frame)
  (cond ((and? exp) (conjoin exp frame))
        ((or? exp) (disjoin exp frame))
        ((not? exp) (negate exp frame))
        ((lisp-value? exp) (lisp-value exp frame))
        ((query? exp) (simple-query exp frame))
        (else (error "Unknown expression type -- EVAL" exp))))


(define (simple-query query-pattern frame)
  (lambda (succeed fail)
    ((find-assertions query-pattern frame) succeed
                                           (lambda ()
                                             ((apply-rules query-pattern frame) succeed
                                                                                fail)))))


(define (conjoin conjuncts frame)
  (lambda (succeed fail)
    (let ((first (analyze (first-conjunct conjuncts) frame)))
      (if (null? (rest-conjuncts conjuncts))
          (first succeed fail)
          (first (lambda (first-value fail2)
                   ((conjoin (rest-conjuncts conjuncts) first-value) succeed
                                                                     fail2))
                 fail)))))

(define (disjoin disjuncts frame)
  (lambda (succeed fail)
    (define (try disjuncts)
      (if (null? disjuncts)
          (fail)
          ((analyze (first-disjunct disjuncts) frame) succeed
                                                      (lambda () (try (rest-disjuncts disjuncts))))))
    (try disjuncts)))

(define (negate operands frame)
  (lambda (succeed fail)
    ((analyze (negated-query operands) frame) (lambda (val fail2)
                                               (fail))
                                             (lambda ()
                                               (succeed frame fail)))))

(define (lisp-value call frame)
  (lambda (succeed fail)
    (if (execute (instantiate call frame (lambda (v f)
                                           (error "Unknown pat var -- LISP-VALUE" v))))
        (succeed frame fail)
        (fail))))
(define (execute exp)
  (apply (eval (predicate exp) user-initial-environment)
         (args exp)))
(define user-initial-environment (scheme-report-environment 5)) ; For racket users; user-initial-environemnt is already defined in mit-scheme.

(define (always-true ignore frame)
  (lambda (succeed fail)
    (succeed frame fail)))


(define (and? exp)
  (tagged-list? exp 'add))

(define (empty-conjunction? exps) (null? exps))
(define (first-conjunct exps) (car exps))
(define (rest-conjuncts exps) (cdr exps))


(define (or? exp)
  (tagged-list? exp 'or))

(define (empty-disjunction? exps) (null? exps))
(define (first-disjunct exps) (car exps))
(define (rest-disjuncts exps) (cdr exps))


(define (not? exp)
  (tagged-list? exp 'not))

(define (negated-query exps) (car exps))


(define (lisp-value? exp)
  (tagged-list? exp 'lisp-value))

(define (predicate exps) (car exps))
(define (args exps) (cdr exps))


(define (always-true? exp)
  (tagged-list? exp 'always-true))


(define (query? exp)
  (pair? exp))


(define (type exp)
  (if (pair? exp)
      (car exp)
      (error "Unknown expression TYPE" exp)))
(define (contents exp)
  (if (pair? exp)
      (cdr exp)
      (error "Unknown expression CONTENTS" exp)))

(define (assertion-to-be-added? exp)
  (eq? (type exp) 'assert!))
(define (add-assertion-body exp)
  (car (contents exp)))

(define (rule? statement)
  (tagged-list? statement 'rule))
(define (tagged-list? exp tag)
  (if (pair? exp)
      (eq? (car exp) tag)
      false))
(define (conclusion rule) (cadr rule))
(define (rule-body rule)
  (if (null? (cddr rule))
      'always-true
      (caddr rule)))

(define rule-counter 0)
(define (new-rule-application-id)
  (set! rule-counter (+ 1 rule-counter))
  rule-counter)
(define (make-new-variable var rule-application-id)
  (cons '? (cons rule-application-id (cdr var))))


(define (query-syntax-process exp)
  (map-over-symbols expand-question-mark exp))
(define (map-over-symbols proc exp)
  (cond ((pair? exp) (cons (map-over-symbols proc (car exp))
                           (map-over-symbols proc (cdr exp))))
        ((symbol? exp) (proc exp))
        (else exp)))
(define (expand-question-mark symbol)
  (let ((chars (symbol->string symbol)))
    (if (string=? (substring chars 0 1) "?")
        (list '? (string->symbol (substring chars 1 (string-length chars))))
        symbol)))
(define (contract-question-mark variable)
  (string->symbol (string-append "?" (if (number? (cadr variable))
                                         (string-append (symbol->string (caddr variable))
                                                        "-"
                                                        (number->string (cadr variable)))
                                         (symbol->string (cadr variable))))))

(define (var? exp)
  (tagged-list? exp '?))
(define (constant-symbol? exp) (symbol? exp))


(define (find-assertions pattern frame)
  (let ((records (fetch-assertions pattern frame)))
    (lambda (succeed fail)
      (define (try assertions)
        (if (null? assertions)
            (fail)
            ((check-an-assertion (car assertions) pattern frame) succeed
                                                                 (lambda ()
                                                                   (try (cdr assertions))))))
      (try records))))

(define (check-an-assertion assertion query-pat query-frame)
  (lambda (succeed fail)
    (let ((match-result
           (pattern-match query-pat assertion query-frame)))
      (if (eq? match-result 'failed)
          (fail)
          (succeed match-result fail)))))

(define (pattern-match pat dat frame)
  (cond ((eq? frame 'failed) 'failed)
        ((equal? pat dat) frame)
        ((var? pat) (extend-if-consistent pat dat frame))
        ((and (pair? pat) (pair? dat)) (pattern-match (cdr pat)
                                                      (cdr dat)
                                                      (pattern-match (car pat)
                                                                     (car dat)
                                                                     frame)))
        (else 'failed)))

(define (extend-if-consistent var dat frame)
  (let ((binding (binding-in-frame var frame)))
    (if binding
        (pattern-match (binding-value binding) dat frame)
        (extend var dat frame))))

(define (apply-rules pattern frame)
  (let ((rules (fetch-rules pattern frame)))
    (lambda (succeed fail)
      (define (try rules)
        (if (null? rules)
            (fail)
            ((apply-a-rule (car rules) pattern frame) succeed
                                                      (lambda ()
                                                        (try (cdr rules))))))
      (try rules))))

(define (apply-a-rule rule query-pattern query-frame)
  (let ((clean-rule (rename-variables-in rule)))
    (let ((unify-result (unify-match query-pattern (conclusion clean-rule) query-frame)))
      (lambda (succeed fail)
        (if (eq? unify-result 'failed)
            (fail)
            ((analyze (rule-body clean-rule) unify-result) succeed
                                                           fail))))))

(define (rename-variables-in rule)
  (let ((rule-application-id (new-rule-application-id)))
    (define (tree-walk exp)
      (cond ((var? exp) (make-new-variable exp rule-application-id))
            ((pair? exp) (cons (tree-walk (car exp)) (tree-walk (cdr exp))))
            (else exp)))
    (tree-walk rule)))

(define (unify-match p1 p2 frame)
  (cond ((eq? frame 'failed) 'failed)
        ((equal? p1 p2) frame)
        ((var? p1) (extend-if-possible p1 p2 frame))
        ((var? p2) (extend-if-possible p2 p1 frame))
        ((and (pair? p1) (pair? p2)) (unify-match (cdr p1)
                                                  (cdr p2)
                                                  (unify-match (car p1)
                                                               (car p2)
                                                               frame)))
        (else 'failed)))

(define (extend-if-possible var val frame)
  (let ((binding (binding-in-frame var frame)))
    (cond (binding (unify-match (binding-value binding) val frame))
          ((var? val) (let ((binding (binding-in-frame val frame)))
                        (if binding
                            (unify-match var (binding-value binding) frame)
                            (extend var val frame))))
          ((depends-on? val var frame) 'failed)
          (else (extend var val frame)))))

(define (depends-on? exp var frame)
  (define (tree-walk e)
    (cond ((var? e) (if (equal? var e)
                        true
                        (let ((b (binding-in-frame e frame)))
                          (if b
                              (tree-walk (binding-value b))
                              false))))
          ((pair? e) (or (tree-walk (car e)) (tree-walk (cdr e))))
          (else false)))
  (tree-walk exp))


(define THE-ASSERTIONS '())
(define (fetch-assertions pattern frame)
  (if (use-index? pattern)
      (get-indexed-assertions pattern)
      (get-all-assertions)))
(define (get-all-assertions) THE-ASSERTIONS)
(define (get-indexed-assertions pattern)
  (get-record (index-key-of pattern) 'assertion-record))
(define (get-record key1 key2)
  (let ((s (get key1 key2)))
    (if s s '())))

(define THE-RULES '())
(define (fetch-rules pattern frame)
  (if (use-index? pattern)
      (get-indexed-rules pattern)
      (get-all-rules)))
(define (get-all-rules) THE-RULES)
(define (get-indexed-rules pattern)
  (append (get-record (index-key-of pattern) 'rule-record)
                 (get-record '? 'rule-record)))

(define (add-rule-or-assertion! assertion)
  (if (rule? assertion)
      (add-rule! assertion)
      (add-assertion! assertion)))
(define (add-assertion! assertion)
  (store-assertion-in-index assertion)
  (let ((old-assertions THE-ASSERTIONS))
    (set! THE-ASSERTIONS (cons assertion old-assertions))
    'ok))
(define (add-rule! rule)
  (store-rule-in-index rule)
  (let ((old-rules THE-RULES))
    (set! THE-RULES (cons rule old-rules))
    'ok))

(define (store-assertion-in-index assertion)
  (if (indexable? assertion)
      (let ((key (index-key-of assertion)))
        (let ((current-assertion-record (get-record key 'assertion-record)))
          (put key 'assertion-record (cons assertion current-assertion-record))))))
(define (store-rule-in-index rule)
  (let ((pattern (conclusion rule)))
    (if (indexable? pattern)
        (let ((key (index-key-of pattern)))
          (let ((current-rule-record (get-record key 'rule-record)))
            (put key 'rule-record (cons rule current-rule-record)))))))

(define (indexable? pat)
  (or (constant-symbol? (car pat))
      (var? (car pat))))
(define (index-key-of pat)
  (let ((key (car pat)))
    (if (var? key) '? key)))
(define (use-index? pat)
  (constant-symbol? (car pat)))


(define (make-binding variable value) (cons variable value))
(define (binding-variable binding) (car binding))
(define (binding-value binding) (cdr binding))
(define (binding-in-frame variable frame) (assoc variable frame))
(define (extend variable value frame) (cons (make-binding variable value) frame))


(define input-prompt ";;; Amb-Eval input:")
(define output-prompt ";;; Amb-Eval value:")
(define (driver-loop)
  (define (internal-loop try-again)
    (prompt-for-input input-prompt)
    (let ((input (query-syntax-process (read))))
      (cond ((eq? input 'try-again) (try-again))
            ((assertion-to-be-added? input) (add-rule-or-assertion! (add-assertion-body input))
                                            (newline)
                                            (display "Assertion added to data base.")
                                            (driver-loop))
             (else (newline)
                   (display ";;; Starting a new problem ")
                   (ambevaln input
                             (lambda (val next-alternative)
                               (let ((result (instantiate input val (lambda (v f)
                                                                      (contract-question-mark v)))))
                                 (announce-output output-prompt)
                                 (display result)
                                 (internal-loop next-alternative)))
                             (lambda ()
                               (announce-output ";;; There are no more values of")
                               (display input)
                               (driver-loop))
                             '())))))
    (internal-loop (lambda ()
                   (newline)
                   (display ";;; There is no current problem")
                   (driver-loop))))
(define (prompt-for-input string)
  (newline) (newline) (display string) (newline))
(define (announce-output string)
  (newline) (display string) (newline))


(define (instantiate exp frame unbound-var-handler)
  (define (copy exp)
    (cond ((var? exp) (let ((binding (binding-in-frame exp frame)))
                        (if binding
                            (copy (binding-value binding))
                            (unbound-var-handler exp frame))))
          ((pair? exp) (cons (copy (car exp)) (copy (cdr exp))))
          (else exp)))
  (copy exp))


(driver-loop)