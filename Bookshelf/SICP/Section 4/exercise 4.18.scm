#lang sicp
; With strategy of this exercise,

; (define (solve f y0 dt)
;   (define y (integral (delay dy) y0 dt))
;   (define dy (stream-map f y))
;   y)

; becomes

; (define (solve f y0 dt)
;   (let ((y '*unassigned) (dy 'unassigned))
;     (let ((a (integral (delay dy) y0 dt)) (b (stream-map f y)))
;       (set! y a)
;       (set! dy b))
;     y))

; which is

; (define (solve f y0 dt)
;   ((lambda (y dy)
;     ((lambda (a b)
;       (set! y a)
;       (set! dy b))
;      (integral (delay dy) y0 dt)
;      (stream-map f y))
;      y)
;    '*unassigned
;    '*unassigned))

; The argument of y and dy is '*unassigned*, so evaluating the argument of a and b will cause error.

; Besides, with strategy in the text, it becomes

; (define (solve f y0 dt)
;   (let ((y '*unassigned) (dy '*unassigned))
;     (set! y (integral (delay dy) y0 dt))
;     (set! dy (stream-map f y))
;     y))

; which is

; (define (solve f y0 dt)
;   ((lambda (y dy)
;      (set! y (integral (delay dy) y0 dt))
;      (set! dy (stream-map f y))
;      y)
;    '*unassigned
;    '*unassigned))

; And this version will not cause problem, because y is set (dy is delayed). and then dy is set with y.