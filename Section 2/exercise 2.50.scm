#lang sicp
(#%require sicp-pict)

; transform-painter requires three argument(painter is no needed) and return a procedure.

(define (flip-horiz painter)
  ((transform-painter (make-vect 1 0) (make-vect 0 0) (make-vect 1 1)) painter))
(paint einstein)
(paint (flip-horiz einstein))

(define (counter-rotate180 painter)
  ((transform-painter (make-vect 1 1) (make-vect 0 1) (make-vect 1 0)) painter))
(paint (counter-rotate180 einstein))

(define (counter-rotate270 painter)
  ((transform-painter (make-vect 0 1) (make-vect 0 0) (make-vect 1 1)) painter))
(paint (counter-rotate270 einstein))