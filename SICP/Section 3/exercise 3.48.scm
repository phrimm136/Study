#lang sicp
; Paul attempts to exchange the acc1 and the acc2, while Peter attemps to exchange the acc2 and the acc1.
; Acc1 is lower-numbered than acc2, so both procedures take acc1 first, and then acc2.
; Once Paul or peter's procedure got acc1, the other can't take acc1, so the later one awaits.

(define (make-account-and-serializer balance acc-num)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (let ((balance-serializer (make-serializer)))
    (define (dispatch m)
      (cond ((eq? m 'withdraw) withdraw)
            ((eq? m 'deposit) deposit)
            ((eq? m 'balance) balance)
            ((eq? m 'serializer) balance-serializer)
            ((eq? m 'number) acc-num)
            (else (error "Unknown request -- MAKE-ACCOUNT"
                         m))))
    dispatch))

(define (serialized-exchange account1 account2)
  (let ((serializer1 (account1 'serializer))
        (serializer2 (account2 'serializer)))
    (if (< (account1 'number) (account2 'number))
        ((serializer1 (serializer2 exchange)) account1 account2)
        ((serializer2 (serializer1 exchange)) account2 account1))))