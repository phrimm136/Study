#lang sicp
; a.

;;; L-Eval input:

; (define (for-each proc items)
;   (if (null? items)
;       'done
;       (begin (proc (car items))
;              (for-each proc (cdr items)))))


;;; L-Eval value:

; ok

;;; L-Eval input:

;(for-each (lambda (x) (newline) (display x)) (list 57 321 88))

; 57
; 321
; 88

;;; L-Eval value:

; done

; In sequence, every expression is evaluated through eval-sequence, and display is primitive procedure,
; so it will call force-it to get argument.


; b.

; (define (p1 x)
;   (set! x (cons x '(2)))
;   x)
; (define (p2 x)
;   (define (p e)
;     e
;     x)
;   (p (set! x (cons x '(2)))))

; Original version

; (p1 1)
; -> (1 2)

; (p2 1)
; -> 1

; Changed version

; (p1 1)
; -> (1 2)

; (p2 1)
; -> (1 2)


; c.

; Because it's just a rebundant forcing.


; d.

; Cy's approach will be better if a sequence is consist of expressions with side effect.