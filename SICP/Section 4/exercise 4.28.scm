#lang sicp
; To put procedure to parameter of a compound procedure, actual-value is needed in eval.
; A procedure as parameter could be a thunk, but evaln has no ability to evaluate thunk,
; so it causes undefined behavior.