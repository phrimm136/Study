#lang sicp
(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount)) balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount)) balance)
  (define (dispatch password-input m)
    (if (eq? password-input password)
        (cond ((eq? m 'withdraw) withdraw)
              ((eq? m 'deposit) deposit)
              (else (error "Unknown request --MAKE-ACCOUNT" m)))
        (lambda (x) "Incorrect password")))
  dispatch)


(define (make-joint account password new-password)
  (define (dispatch password-input m)
    (if (eq? new-password password-input)
        (account password m)
        (lambda (x) "Incorrect password")))
  dispatch)


(define peter-acc (make-account 100 'open-sesame))
(define paul-acc (make-joint peter-acc 'open-sesame 'rosebud))

((peter-acc 'open-sesame 'withdraw) 40)
((peter-acc 'wrong-password 'deposit) 50)
((paul-acc 'rosebud 'withdraw) 40)
((paul-acc 'wrong-password 'deposit) 50)