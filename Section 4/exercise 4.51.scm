#lang sicp
; Append this into analyze
((permanent-set? exp) (analyze-permanent-set exp))


(define (analyze-permanent-set exp)
  (let ((var (assignment-variable exp))
        (vproc (analyze (assignment-value exp))))
    (lambda (env succeed fail)
      (vproc env
             (lambda (val fail2)
               (set-variable-value! var val env)
               (succeed 'ok fail2))
             fail))))


(define (permanent-set? exp)
  (tagged-list? exp 'permanent-set!))


; (define count 0)
; (let ((x (an-element-of '(a b c)))
;       (y (an-element-of '(a b c))))
;   (permanent-set! count (+ count 1))
;   (require (not (eq? x y)))
;   (list x y count))

; If we use set! instead of permanent-set! , the value of the count remains 1.