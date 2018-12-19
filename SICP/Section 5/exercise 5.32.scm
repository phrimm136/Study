#lang sicp
; a.

ev-application
(save continue)
(assign exp (op operator) (reg exp))
(assign unev (op operands) (reg exp))
(test (op symbol?) (reg exp))
(branch (label ev-appl-symbol-operator))
(save env)
(save unev)
(assign continue (label ev-appl-did-operator))
(goto (label eval-dispatch))

ev-appl-symbol-operator
(assign continue (label ev-appl-did-symbol-operator))
(goto (label eval-dispatch))

ev-appl-did-operator
(restore unev)
(restore env)

ev-appl-did-symbol-operator
(assign argl (op empty-arglist))
(assign proc (reg val))
(test (op no-operands?) (reg unev))
(branch (label apply-dispatch))
(save proc)


; b.

; If compiler needs to consider lots of case to optimize, compile time would become longer. Maybe compilation won't be completed.
; So we may need to lower optimization level to complete compilation.