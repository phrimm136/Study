#lang sicp
; a.

(controller (assign continue (label append-end))

            tokenize-loop
            (test (op null?) (reg x))
            (branch (label x-null))
            (save continue)
            (assign x-ele (op car) (reg x))
            (assign x (op cdr) (reg x))
            (save x-ele)
            (assign continue (label append-loop))
            (goto (label break-loop))

            x-null
            (assign z (reg y))
            (goto (reg continue))

            append-loop
            (restore x-ele)
            (assign z (op cons) (reg x-ele) (reg z))
            (restore continue)
            (goto (reg continue))

            append-end)


; b.

(controller (assign tmp (reg x))
                  
            append-loop
            (assign last (op cdr) (reg tmp))
            (test (op null?) (reg last))
            (branch (label append!))
            (assign tmp (op cdr) (reg tmp))
            (goto (label append-loop))

            append!
            (perform (op set-cdr!) (reg tmp) (reg y)))