#lang sicp
(#%require sicp-pict)

(define (split op1 op2)
  (lambda (painter n)
    (define (recursive n)
      (if (= n 0)
          painter
          (op1 painter (op2 (recursive (- n 1)) (recursive (- n 1))))))
    (recursive n)))
(define right-split (split beside below))
(define up-split (split below beside))

(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter (- n 1))))
        (let ((top-left (beside up up))
              (bottom-right (below right right))
              (corner (corner-split painter (- n 1))))
          (beside (below painter top-left)
                  (below bottom-right corner))))))

(paint (corner-split einstein 5))