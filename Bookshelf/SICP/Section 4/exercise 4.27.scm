#lang sicp
; (define w (id (id 10)))

;;; L-Eval input:
; count

;;; L-Eval value:
; 1

;;; L-Eval input:
; w

;;; L-Eval value:
; 10

;;; L-Eval input:
; count

;;; L-Eval value:
; 2


; The parameter of w - (id (id 10)) - is evaluated in eval-definition.
; It is identical to (id ('thunk (id 10))) and evaluated by evaln, not actual-value.
; By this reason, the inner thunk is not evaluated until application, so assignment is not processed.