#lang sicp
(define expt-recur
  (make-machine '(n b val continue)
                (list (list '= =) (list '- -) (list '* *))
                '(controller (assign continue (label exp-done))

                             exp-loop
                             (test (op =) (reg n) (const 0))
                             (branch (label base-case))
                             (save continue)
                             (assign continue (label after-exp))
                             (assign n (op -) (reg n) (const 1))
                             (goto (label exp-loop))

                             after-loop
                             (restore continue)
                             (assign val (op *) (reg val) (reg b))
                             (goto (reg continue))

                             base-case
                             (assign val (const 1))
                             (goto (reg continue))

                             exp-done)))

(set-register-contents! 'b 2)
(set-register-contents! 'n 3)
(start expt-recur)
(get-register-content val)


(define expt-iter
  (make-machine '(n p b)
                (list (list '= =) (list '* *) (list '- -))
                '(controller (assign produce (const 1))

                             exp-loop
                             (test (op =) (reg n) (const 0))
                             (branch (label exp-done))
                             (assign p (op *) (reg p) (reg b))
                             (assign n (op -) (reg n) (const 1))
                             (goto (labal exp-loop))

                             exp-done)))

(set-register-contents! 'b 2)
(set-register-contents! 'n 3)
(start expt-iter)
(get-register-content val)