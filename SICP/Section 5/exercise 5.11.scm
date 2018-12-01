#lang sicp
; a.

(controller (assign continue (label fib-done))
            
            fib-loop
            (test (op <) (reg n) (const 2))
            (branch (label immediate-answer))
            (save continue)
            (assign continue (label afterfib-n-1))
            (save n)
            (assign n (op -) (reg n) (const 1))
            (goto (label fib-loop))
            
            afterfib-n-1
            (restore n)
            (restore continue)
            (assign n (op -) (reg n) (const 2))
            (save continue)
            (assign continue (label afterfib-n-2))
            (save val)
            (goto (label fib-loop))
            
            afterfib-n-2
            ;(assign n (reg val))
            ;(restore val)
            (restore n) ; It just causes changing the contents of those registers.
            (restore continue)
            (assign val (op +) (reg val) (reg n))
            (goto (reg continue))
            
            immediate-answer
            (assign val (reg n))
            (goto (reg continue))
            fib-done)


; b.

(define (make-save inst machine stack pc)
  (let ((reg (get-register machine (stack-inst-reg-name inst))))
    (lambda ()
      (push stack (cons (stack-inst-reg-name inst) (get-contents reg)))
      (advance-pc pc))))
(define (make-restore inst machine stack pc)
  (let ((reg (get-register machine (stack-inst-reg-name inst))))
    (lambda ()
      (let ((stack-top (pop stack)))
        (if (eq? (stack-inst-reg-name inst) (car stack-top))
            (set-contents! reg (cdr stack-top))
            (error "Inappropriate access -- MAKE-RESTORE" reg))
        (advance-pc pc)))))
(define (stack-inst-reg-name stack-instruction) (cadr stack-instruction))


; c.

(define (make-stack)
  (let ((s '()))
    (define (push name x)
      (let ((reg-stack (assoc name s)))
        (if reg-stack
            (set-cdr! reg-stack (cons x (cdr reg-stack)))
            (error "Invalid register name -- PUSH" name))))
    (define (pop name)
      (let ((reg-stack (assoc name s)))
        (if reg-stack
            (if (null? (cdr reg-stack))
                (error "Empty stack -- POP" name)
                (let ((top (cadr reg-stack)))
                  (set-cdr! reg-stack (cddr reg-stack))
                  top))
            (error "Invalid register name -- POP" name))))
    (define (initialize)
      (for-each (lambda (stack) (set-cdr! stack '())) s)
      'done)
    (define (add name)
      (set! s (cons (cons name '()) s)))
    (define (dispatch message)
      (cond ((eq? message 'push) push)
            ((eq? message 'pop) pop)
            ((eq? message 'initialize) (initialize))
            ((eq? message 'add) add)
            (else (error "Unknown request -- STACK" message))))
    dispatch))

; In (make-new-machine)
(define (allocate-register name)
  (if (assoc name register-table)
      (error "Multiply defined register: " name)
      (begin (set! register-table (cons (list name (make-register name)) register-table))
             ((stack 'add) name)))
  'register-allocated)

(define (make-save inst machine stack pc)
  (let ((reg (get-register machine (stack-inst-reg-name inst))))
    (lambda ()
      (push stack (stack-inst-reg-name inst) (get-contents reg))
      (advance-pc pc))))
(define (make-restore inst machine stack pc)
  (let ((reg (get-register machine (stack-inst-reg-name inst))))
    (lambda ()
      (set-contents! reg (pop stack (stack-inst-reg-name inst)))
      (advance-pc pc))))