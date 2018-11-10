#lang sicp
(define (analyze-sequence exps)
  (define (execute-sequence procs env)
    (cond ((null? (cdr procs)) ((car procs) env))
          (else ((car procs) env)
                (execute-sequence (cdr procs) env))))
  (let ((procs (map analyze exps)))
    (if (null? procs)
        (error "Empty sequence -- ANALYZE"))
    (lambda (env) (execute-sequence procs env))))


;                           In the text                                        Alyssa's

; e1             (lambda (env) ((analyze e1) env))                (lambda (env) ((analyze e1) env))

; e1 e2          (lambda (env)                                    (lambda (env) ((analyze e1) env)
;                  (lambda (env) ((analyze e1) env)                             ((analyze e2) env))
;                                ((analyze e2) env))
;                    env))

; e1 e2 e3       (lambda (env)                                    (lambda (env) ((analyze e1) env)
;                  (lambda (env) ((analyze e1) env)                             ((analyze e2) env)
;                                ((analyze e2) env))                            ((analyze e3) env))
;                    env)
;                  ((analyze e3) env))