#lang sicp
; Test is available in eval-apply.

; when passing procedure to map as a primitive, it is wrapped with 'primitive or 'procedure,
; so it causes 'not a procedure' error.