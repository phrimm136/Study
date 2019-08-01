#lang sicp
; A bound rule should be settled in the histroy.
; When a rule is about to apply, it should be checked whether it's duplicate.
; If so, it aborts. Otherwise, it is added to the history and keeps applying.


(define (apply-a-rule rule query-pattern query-frame)
  (let ((clean-rule (rename-variables-in rule)))
    (let ((unify-result (unify-match query-pattern (conclusion clean-rule) query-frame)))
      (if (eq? unify-result 'failed)
          the-empty-stream
          (let ((instant (instantiate query-pattern query-frame (lambda (var frame)
                                                                  (rename-variable var)))))
            (if (processing-query? instant history)
                the-empty-stream
                (begin (extend-history! instant)
                       (qeval (rule-body clean-rule) (singleton-stream unify-result)))))))))
(define (rename-variable var)
  (if (number? (cadr var))
      (cons '? (cons (- (cadr var)) (cddr var)))
      (cons '? (cons '- (cdr var)))))
(define (free-var? var frame)
  (let ((binding (binding-in-frame var frame)))
    (or (not binding)
        (and (var? (binding-value binding))
             (free-var? (binding-value binding) frame)))))
(define (all-free? vars frame)
  (cond ((null? vars) true)
        ((not (free-var? (car vars) frame)) false)
        (else (all-free? (cdr vars) frame))))
(define (in-history? query history)
  (cond ((null? history) false)
        ((history-hit? (car history) query) true)
        (else (in-history? query (cdr history)))))
(define (variables query)
  (cond ((var? query) (list query))
        ((pair? query) (append (variables (car query))
                               (variables (cdr query))))
        (else '())))
(define (history-hit? history-entry query)
  (let ((vars (variables history-entry))
        (unify-result (unify-match history-entry query '())))
    (and (not (eq? unify-result 'failed))
         (all-free? vars unify-result))))

(define history '())
(define (extend-history! instant)
  (set! history (cons instant history)))