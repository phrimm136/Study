#lang sicp
(define (make-execution-procedure inst labels machine pc flag stack ops)
  (cond ((eq? (car inst) 'assign) (make-assign inst machine labels ops pc))
        ((eq? (car inst) 'test) (make-test inst machine labels ops flag pc))
        ((eq? (car inst) 'branch) (make-branch inst machine labels flag pc))
        ((eq? (car inst) 'goto) (make-goto inst machine labels pc))
        ((eq? (car inst) 'save) (make-save inst machine stack pc))
        ((eq? (car inst) 'restore) (make-restore inst machine stack pc))
        ((eq? (car inst) 'perform) (make-perform inst machine labels ops pc))
        ((eq? (car inst) 'flush) (make-flush inst machine pc)) ; Added.
        (else (error "Unknown instruction type -- ASSEMBLE" inst))))


(define (make-flush inst machine pc)
  (let ((target (get-register machine (flush-reg-name inst))))
    (lambda ()
      (set-contents! target '())
      (advance-pc pc))))
(define (flush-reg-name flush-instruction) (cadr flush-instruction))


(define mac
  (make-machine '(a)
                (list (list nil nil))
                '((assign a (const 1))
                  (flush a))))