#lang sicp
(define (exchange account1 account2)
  (let ((difference (- (account1 ’balance)
                       (account2 ’balance))))
    ((account1 ’withdraw) difference)
    ((account2 ’deposit) difference)))

(define (transfer from-account to-account amount)
 ((from-account ’withdraw) amount)
 ((to-account ’deposit) amount))

; We don't have to evaluate how much money we need to apply every pair of withdraw and deposit procedure.
; So above transfer procedure is enough.