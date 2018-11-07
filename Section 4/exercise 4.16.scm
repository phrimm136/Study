#lang sicp
(define (lookup-variable-value var env)
  (define (env-loop env)
    (define (scan vars vals)
      (cond ((null? vars) (env-loop (enclosing-environment env)))
            ((eq? (car vals) '*unassigned*) (error "Variable is not yet assigned" (car vars)))
            ((eq? var (car vars)) (car vals))
            (else (scan (cdr vars) (cdr vals)))))
    (if (eq? env the-empty-environment)
        (error "Unbound variable" var)
        (let ((frame (first-frame env)))
          (scan (frame-variables frame)
                (frame-values frame)))))
  (env-loop env))


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
          (cons (list (car variables) '*unassigned*)
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


; Inserting scan-out-defines in make-procedure is better.
; If we insert it in procedure-body, we should transform its internal definitions each time we call it.