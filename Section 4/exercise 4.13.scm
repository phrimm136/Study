#lang sicp
(define (make-unbound! var env)
  (define (scan pre-vars pre-vals vars vals)
      (cond ((null? vars) (error "Unbound variable" var))
            ((eq? var (car vars)) (set-cdr! pre-vars (cdr vars))
                                  (set-cdr! pre-vals (cdr vals)))
            (else (set! pre-vars vars)
                  (set! pre-vals vals)
                  (scan vars vals (cdr vars) (cdr vals)))))
    (if (eq? env the-empty-environment)
        (error "Unbound variable" var)
        (let ((frame (first-frame env)))
          (scan (cdr (frame-variables frame))
                (cdr (frame-values frame))
                (frame-variables frame)
                (frame-values frame)))))

; Unbinding variables should be done in an environment the variable is in.
; Unbinding variables in the enclosing environment has probability to cause undefined behavior.

; We should remove only the binding in the first frame of the environment.
; All variables in a frame are identical, but not among environments.
; Removing more than one binding can cause undefined behavior.