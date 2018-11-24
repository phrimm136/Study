#lang sicp
(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1))
                 (fib (- n 2))))))


(define (make-table)
  (list '*table*))
(define (lookup key table)
  (let ((record (assoc key (cdr table))))
    (if record
        (cdr record)
        false)))
(define (insert! key value table)
  (let ((record (assoc key (cdr table))))
    (if record
        (set-cdr! record value)
        (set-cdr! table
                  (cons (cons key value) (cdr table)))))
  'ok)

(define (memoize f)
  (let ((table (make-table)))
    (lambda (x)
      (let ((previously-computed-result (lookup x table)))
        (or previously-computed-result
            (let ((result (f x)))
              (insert! x result table)
              result))))))

(define memo-fib
  (memoize (lambda (n)
             (cond ((= n 0) 0)
                   ((= n 1) 1)
                   (else (+ (memo-fib (- n 1))
                            (memo-fib (- n 2))))))))

;           ┌─────────────────────────────────────────────────────────────────────────────────────────────────┐
;           │other variables                                                                                  │
; global -> │memoize:──────────────────────────────────────┐                                                  │
; env       │memo-fib:──┐                                  │                                                  │
;           └───────────┼──────────────────────────────────┼──────────────────────────────────────────────────┘
;                       │                                  │      ∧                     ∧                  ∧
;                       ∨                                  ∨      │            ┌──────────────────┐        │
;                       ◎◎─────────────────────┐           ◎◎─────┘           │f                 │ E1      │
;                       ∨                      │           ∨                  └──────────────────┘          │
;                       parameter:x            │           parameter:f               ∧     ∨                │
;                       body:(let(...))        │           body:(lambda (x)...)      │     ◎◎───────────────┘
;                                              │                                     │     ∨
;                                              │                                     │     parameter:n
;                                              │                                     │     body:(cond...)
;                                              │                           ┌──────────────────┐
;                                              └──────────────────────────>│table             │ E2
;                                                                          └──────────────────┘

(memo-fib 3)
;           ┌─────────────────────────────────────────────────────────────────────────────────────────────────┐
;           │other variables                                                                                  │
; global -> │memoize:...                                                                                      │
; env       │memo-fib:...                                                                                     │
;           └─────────────────────────────────────────────────────────────────────────────────────────────────┘
;                 ∧         ∧         ∧        ∧         ∧                               ∧
;               ┌───┐     ┌───┐     ┌───┐     ┌───┐     ┌───┐                   ┌──────────────────┐
;           E3->│n:3│ E4->│n:2│ E5->│n:1│ E6->│n:0│ E7->│n:1│                   │f                 │ E1
;               └───┘     └───┘     └───┘     └───┘     └───┘                   └──────────────────┘
;                                                                                   ∧
;                                                                                   │
;                                                                                   │
;                                                                                   │
;                                                                                   │
;                                                                          ┌──────────────────┐
;                                                                          │table             │ E2
;                                                                          └──────────────────┘


((memoize fib) 3) ; It works, but it memoizes only once(since only fib iterates).