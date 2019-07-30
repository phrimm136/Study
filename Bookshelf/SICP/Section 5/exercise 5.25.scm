#lang sicp
eval-dispatch
(test (op self-evaluating?) (reg exp))
(branch (label ev-self-eval))
(test (op variable?) (reg exp))
(branch (label ev-variable))
(test (op quoted?) (reg exp))
(branch (label ev-quoted))
(test (op assignment?) (reg exp))
(branch (label ev-assignment))
(test (op definition?) (reg exp))
(branch (label ev-definition))
(test (op if?) (reg exp))
(branch (label ev-if))
(test (op lambda?) (reg exp))
(branch (label ev-lambda))
(test (op begin?) (reg exp))
(branch (label ev-begin))
(test (op application?) (reg exp))
(branch (label ev-application))
(goto (label unknown-expression-type))

ev-self-eval
(assign val (reg exp))
(goto (reg continue))
    
ev-variable
(assign val (op lookup-variable-value) (reg exp) (reg env))
(goto (reg continue))
    
ev-quoted
(assign val (op text-of-quotation) (reg exp))
(goto (reg continue))
    
ev-lambda
(assign unev (op lambda-parameters) (reg exp))
(assign exp (op lambda-body) (reg exp))
(assign val (op make-procedure) (reg unev) (reg exp) (reg env))
(goto (reg continue))

ev-application
(save continue)
(save env)
(assign unev (op operands) (reg exp))
(save unev)
(assign exp (op operator) (reg exp))
(assign continue (label ev-appl-did-operator))
(goto (label actual-value))

ev-appl-did-operator
(restore unev)
(restore env)
(assign argl (op empty-arglist))
(assign proc (reg val))
(save proc)

apply-dispatch
(test (op primitive-procedure?) (reg proc))
(branch (label list-of-arg-values))
(test (op compound-procedure?) (reg proc))
(branch (label list-of-delayed-args))
(goto (label unknown-procedure-type))

list-of-arg-values
(save argl)
(assign exp (op first-operand) (reg unev))
(test (op last-operand?) (reg unev))
(branch (label ev-appl-last-arg))
(save env)
(save unev)
(assign continue (label ev-appl-accum-arg))
(goto (label actual-value))

ev-appl-accum-arg
(restore unev)
(restore env)
(restore argl)
(assign argl (op cons) (reg val) (reg argl))
(assign unev (op rest-operands) (reg unev))
(goto (label list-of-arg-values))

ev-appl-last-arg
(assign continue (label ev-appl-accum-last-arg))
(goto (label actual-value))

ev-appl-accum-last-arg
(assign argl (op cons) (reg val) (reg argl))
(restore proc)
(goto (label ev-appl-did-operands))

ev-appl-did-operands
(assign val (op apply-primitive-procedure) (reg proc) (reg argl)) 
(restore continue) 
(goto (reg continue))

list-of-delayed-args
(save argl)
(assign exp (op first-operand) (reg unev))
(test (op last-operand?) (reg exp))
(branch (label delayed-last-arg))
(save env)
(save unev)
(assign continue (label delayed-accum-arg))
(goto (label delay-it))

delayed-accum-arg
(restore unev)
(restore env)
(restore argl)
(assign argl (op cons) (reg val) (reg argl))
(assign unev (op rest-operands) (reg unev))
(goto (label list-of-delayed-args))

delayed-last-arg
(assign continue (label delayed-accum-lat-arg))
(goto (label delay-it))

delayed-accum-last-arg
(restoer argl)
(assign argl (op cons) (reg val) (reg argl))
(restore proc)
(goto (label compound-apply))

compound-apply
(assign unev (op procedure-parameters) (reg proc))
(assign env (op procedure-environment) (reg proc))
(assign env (op extend-environment) (reg unev) (reg argl) (reg env))
(assign unev (op procedure-body) (reg proc))
(goto (label ev-sequence))

ev-begin
(assign unev (op begin-actions) (reg exp))
(save continue)
(goto (label ev-sequence))

ev-sequence
(test (op no-more-exps?) (reg unev))
(branch (label ev-sequence-end))
(assign exp (op first-exp) (reg unev))
(save unev)
(save env)
(assign continue (label ev-sequence-continue))
(goto (label eval-dispatch))
    
ev-sequence-continue
(restore env)
(restore unev)
(assign unev (op rest-exps) (reg unev))
(goto (label ev-sequence))
    
ev-sequence-end
(restore continue)
(goto (reg continue))

ev-if
(save exp)
(save env)
(save continue)
(assign continue (label ev-if-decide))
(assign exp (op if-predicate) (reg exp))
(goto (label eval-dispatch))

ev-if-decide
(restore continue)
(restore env)
(restore exp)
(test (op true?) (reg val))
(branch (label ev-if-consequent))
    
ev-if-alternative
(assign exp (op if-alternative) (reg exp))
(goto (label eval-dispatch))
    
ev-if-consequent
(assign exp (op if-consequent) (reg exp))
(goto (label eval-dispatch))

ev-assignment
(assign unev (op assignment-variable) (reg exp))
(save unev)
(assign exp (op assignment-value) (reg exp))
(save env)
(save continue)
(assign continue (label ev-assignment-1))
(goto (label eval-dispatch))
    
ev-assignment-1
(restore continue)
(restore env)
(restore unev)
(perform (op set-variable-value!) (reg unev) (reg val) (reg env))
(assign val (const ok))
(goto (reg continue))

ev-definition
(assign unev (op definition-variable) (reg exp))
(save unev)
(assign exp (op definition-value) (reg exp))
(save env)
(save continue)
(assign continue (label ev-definition-1))
(goto (label eval-dispatch))

ev-definition-1
(restore continue)
(restore env)
(restore unev)
(perform (op define-variable!) (reg unev) (reg val) (reg env))
(assign val (const ok))
(goto (reg continue))

actual-value
(save continue)
(assign continue (label force-it))
(save env)
(goto (label eval-dispatch))

force-it
(restore env)
(test (op thunk?) (reg val))
(branch (label force-it-thunk))
(test (op evaluated-thunk?) (reg val))
(branch (label force-it-thunk-value))
(restore continue)
(goto (reg continue))

force-it-thunk
(save env)
(save val)
(assign env (op thunk-env) (reg val))
(assign exp (op thunk-exp) (reg val))
(assign continue (label force-it-thunk-assign))
(goto (label actual-value))

force-it-thunk-assign
(restore exp) ; Catch saved val.
(restore env)
(save val)
(assign val (op list) (reg val))
(perform (op set-car!) (reg exp) (const evaluated-thunk))
(perform (op set-cdr!) (reg exp) (reg val))
(restore val)
(restore continue)
(goto (reg continue))

force-it-thunk-value
(assign val (op thunk-value) (reg val))
(restore continue)
(goto (reg continue))

delay-it
(assign val (op list) (const thunk) (reg exp) (reg env))
(goto (reg continue))

