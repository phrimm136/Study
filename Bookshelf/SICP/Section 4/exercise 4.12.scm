#lang sicp
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

(define (scan var env found not-in-frame not-in-env)
  (let ((frame (first-frame env)))
    (let go ((vars (frame-variables frame)) (vals (frame-variables frame)))
      (cond ((eq? env the-empty-environment) (not-in-env))
            ((null? vars) (not-in-frame env frame))
            ((eq? var (car vars)) (found vals))
            (else (go (cdr vars) (cdr vals)))))))

(define (lookup-variable-value var env)
  (scan var
        env
        (lambda (vals) (car vals))
        (lambda (env frame) (lookup-variable-value var (enclosing-environment env)))
        (lambda () (error "Unbound variable" var))))
(define (extend-environment vars vals base-env)
  (if (= (length vars) (length vals))
      (cons (make-frame vars vals) base-env)
      (if (< (length vars) (length vals))
          (error "Too many arguments supplied" vars vals)
          (error "too few arguments supplied" vars vals))))
(define (define-variable! var val env)
  (scan var
        env
        (lambda (vals) (set-car! vals val))
        (lambda (env frame) (define-variable! var val (enclosing-environment env)))
        (lambda () (error "Undound variable" var))))
(define (set-variable-value! var val env)
  (scan var
        env
        (lambda (vals) (set-car! vals val))
        (lambda (env frame) (add-binding-to-frame! var val frame))
        (lambda () (error "Unbound variable -- SET!" var))))