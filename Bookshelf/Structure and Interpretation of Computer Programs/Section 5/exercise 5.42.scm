#lang sicp
(define (compile-variable exp target linkage cmpl-tm-env)
  (let ((var-addr (find-variable exp cmpl-tm-env)))
    (end-with-linkage linkage
                      (make-instruction-sequence '(env)
                                                 (list target)
                                                 (if (eq? var-addr 'not-found)
                                                     `((assign ,target (op lookup-variable-value) (const ,exp) (reg env)))
                                                     `((assign ,target (op lexical-address-lookup) (const ,var-addr) (reg env))))))))

(define (compile-assignment exp target linkage cmpl-tm-env)
  (let ((var (assignment-variable exp))
        (get-value-code (compile (assignment-value exp) 'val 'next cmpl-tm-env)))
    (let ((var-addr (find-variable var cmpl-tm-env)))
      (end-with-linkage linkage
                        (preserving '(env)
                                    get-value-code
                                    (make-instruction-sequence '(env val)
                                                               (list target)
                                                               (if (eq? var-addr 'not-found)
                                                                   `((perform (op set-variable-value!) (const ,var) (reg val) (reg env))
                                                                     (assign ,target (const ok)))
                                                                   `((perform (op lexical-address-set!) (const ,var-addr) (reg env) (reg val))
                                                                     (assign ,target (const ok))))))))))