#lang sicp
; The compiler produces operands in right-to-left order, because construct-arglist procedure reverses arguments and cons them from left to right.

; To make order of operands compilation left-to-right, modify construct-arglist and code-to-get-rest-args.

(define (construct-arglist operand-codes)
  (if (null? operand-codes)
      (make-instruction-sequence '()
                                 '(argl)
                                 '((assign argl (const ()))))
      (let ((code-to-get-last-arg (append-instruction-sequences (car operand-codes)
                                                                (make-instruction-sequence '(val)
                                                                                           '(argl)
                                                                                           '((assign argl (op list) (reg val)))))))
        (if (null? (cdr operand-codes))
            code-to-get-last-arg
            (preserving '(env)
                        code-to-get-last-arg
                        (code-to-get-rest-args (cdr operand-codes)))))))
(define (code-to-get-rest-args operand-codes)
  (let ((code-for-next-arg (preserving '(argl)
                                       (car operand-codes)
                                       (make-instruction-sequence '(val argl)
                                                                  '(argl)
                                                                  '((assign val (op list) (reg val))
                                                                    (assign argl (op append) (reg argl) (reg val)))))))
    (if (null? (cdr operand-codes))
        code-for-next-arg
        (preserving '(env)
                    code-for-next-arg
                    (code-to-get-rest-args (cdr operand-codes))))))

; But this version produces more instructions ((assign val (op list) (reg val)) and (assign argl (op append) (reg argl) (reg val)) instead of (assign argl (op cons) (reg val) (reg argl))), so it's not efficient.