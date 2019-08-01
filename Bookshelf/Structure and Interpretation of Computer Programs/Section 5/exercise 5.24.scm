#lang sicp
ev-cond
(save continue)
(assign unev (op cond-clauses) (reg exp))

cond-loop
(test (op null?) (reg unev))
(branch (label cond-false))
(assign exp (op cond-first-cluase-predicate) (reg unev))
(test (op else-check) (reg exp))
(branch (label cond-true))
(save unev)
(save env)
(assign continue (label cond-check))
(goto (label eval-dispatch))

cond-check
(restore env)
(restore unev)
(test (op true?) (reg val))
(branch cond-true)
(assign unev (op cond-rest-cluases) (reg unev))
(goto cond-loop)

cond-true
(assign unev (op cond-first-cluase-action) (reg exp))
(goto (label eval-sequence))

cond-false
(assign val (const false))
(restore continue)
(goto (reg continue))