#lang sicp
(define (exchange account1 account2)
  (let ((difference (- (account1 'balance)
                       (account2 'balance))))
    ((account1 'withdraw) difference)
    ((account2 'deposit) difference)))

(parallel-execute (exchange acc1 acc2) (exchange acc1 acc3))
; acc1      acc2      acc3
; 10$       20$       30$
; --interleaved--
; +20                 -20
; set to 30           set to 10
; 30$                 10$
; +10       -10
; set to 40 set to 10
; 40$       10$       10$


; acc1      acc2      acc3
; 10$       20$       30$
; +10       -10
; +20                 -20
; set to 20 set to 10
; set to 30           set to 10
; 30$       10$       10$