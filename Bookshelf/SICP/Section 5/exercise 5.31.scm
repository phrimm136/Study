#lang sicp
(f 'x 'y) ; All save/restores are superfluous.

((f) 'x 'y) ; All save/restores are superfluous since env change by evaluation of (f) doesn't matter to 'x and 'y.

(f (g 'x) y) ; Proc and argl need to save/restore. Env also need to save/restore to evaluate operand y.

(f (g 'x) 'y) ; Proc and argl need to save/restore. Env is not have to save/restore because env change by evaluation of (g 'x) doesn't matter to 'y.