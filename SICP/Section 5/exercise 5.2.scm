#lang sicp
; The book focuses on controller, so I will omit data-path descriptions.

(controller (assign product (const 1))
            (assign counter (const 1))
            test-fib            
            (test (op >) (reg counter) (reg n))
            (branch (label fib-done))
            (assign product (op *) (reg product) (reg counter))
            (assign counter (op +) (reg counter) (const 1))
            (goto (label test-fib))
            fib-done)