#lang sicp
(#%require sicp-pict)

; transform-painter requires three argument(painter is no needed) and return a procedure.

(define (below painter1 painter2)
  (let ((split-point (make-vect .0 .5)))
    (let ((paint-lower ((transform-painter (make-vect .0 .0) (make-vect 1.0 .0) split-point) painter1))
          (paint-upper ((transform-painter split-point (make-vect 1.0 .5) (make-vect .0 1.0)) painter2)))
      (lambda (frame) (paint-lower frame) (paint-upper frame)))))

(paint (below einstein einstein))


(define (beside painter1 painter2)
  (let ((split-point (make-vect 0.5 0.0)))
    (let ((paint-left
           ((transform-painter (make-vect 0.0 0.0)
                               split-point
                               (make-vect 0.0 1.0)) painter1))
          (paint-right
           ((transform-painter split-point
                               (make-vect 1.0 0.0)
                               (make-vect 0.5 1.0)) painter2)))
      (lambda (frame)
        (paint-left frame)
        (paint-right frame)))))
(define (counter-rotate180 painter)
  ((transform-painter (make-vect 1 1) (make-vect 0 1) (make-vect 1 0)) painter))
(define (counter-rotate270 painter)
  ((transform-painter (make-vect 0 1) (make-vect 0 0) (make-vect 1 1)) painter))

(define (below-another painter1 painter2)
  (counter-rotate180 (counter-rotate270 (beside (counter-rotate270 painter1) (counter-rotate270 painter2)))))

(paint (below-another einstein einstein))