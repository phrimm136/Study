#lang sicp
(define (compile-and-run expression)
  (assemble (statements (compile expression 'val 'return))
            read-compile-execute-print))


(define read-compile-execute-print
  (make-machine '(exp env proc val argl continue)
                (append eceval-operations (list 'compile-and-run compile-and-run))
                '((perform (op initialize-stack))

                  loop
                  (perform (op prompt-for-input) (const ";;; EC-Eval input:"))
                  (assign exp (op read))
                  (assign env (op get-global-environment))
                  (assign val (op compile-and-run) (reg exp))
                  (assign continue (label print))
                  (goto (reg val))

                  print
                  (perform (op print-stack-statistics))
                  (perform (op announce-output) (const ";;; EC-Eval value:"))
                  (perform (op user-print) (reg val))
                  (goto (label loop)))))