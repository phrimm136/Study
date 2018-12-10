#lang sicp
(controller (assign tmp (reg x))
                  
            append-loop
            (assign last (op cdr) (reg tmp))
            (test (op null?) (reg last))
            (branch (label append!))
            (assign tmp (op cdr) (reg tmp))
            (goto (label append-loop))

            append!
            (perform (op set-cdr!) (reg tmp) (reg y)))