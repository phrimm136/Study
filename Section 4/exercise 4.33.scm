#lang sicp
; In evaln,
((quoted? exp) (eval-quotation exp env))

(define (eval-quotation exp env)
  (define (iter ele)
    (cond ((null? ele) (list 'quote '()))
          (else (list 'cons
                      (if (not (pair? (car ele)))
                          (list 'quote (car ele))
                          (iter (car ele)))
                      (iter (cdr ele))))))
  (if (not (pair? (cadr exp)))
      (cadr exp)
      (evaln (iter (cadr exp)) env)))