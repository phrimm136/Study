#lang sicp
(define (list-of-values exps env)
  (if (no-operands? exps)
      '()
      (cons (eval (first-operand exps) env)
            (list-of-values (rest-operands exps) env))))


(define (list-of-values-LTR exps env)
  (if (no-operands? exps)
      '()
      (let ((left (eval (first-operand exps) env)))
        (let ((right (list-of-values (rest-operands exps) env)))
          (cons left right)))))

(define (list-of-values-RTL exps env)
  (if (no-operands? exps)
      '()
      (let ((left (list-of-values (rest-operands exps) env)))
        (let ((right (eval (first-operand exps) env)))
          (cons left right)))))