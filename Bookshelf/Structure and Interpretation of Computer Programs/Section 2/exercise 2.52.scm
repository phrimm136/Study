#lang sicp
(#%require sicp-pict)

(define wave
  (segments->painter (list (make-segment (make-vect .0 .62) (make-vect .15 .4))
                           (make-segment (make-vect .15 .4) (make-vect .3 .58))
                           (make-segment (make-vect .3 .58) (make-vect .35 .48))
                           (make-segment (make-vect .35 .48) (make-vect .25 0))
                           (make-segment (make-vect .42 0) (make-vect .5 .25))
                           (make-segment (make-vect .5 .25) (make-vect .58 .0))
                           (make-segment (make-vect .75 .0) (make-vect .6 .4))
                           (make-segment (make-vect .6 .4) (make-vect 1.0 .12))
                           (make-segment (make-vect 1.0 .3) (make-vect .75 .62))
                           (make-segment (make-vect .75 .62) (make-vect .6 .62))
                           (make-segment (make-vect .6 .62) (make-vect .65 .81))
                           (make-segment (make-vect .65 .81) (make-vect .6 1.0))
                           (make-segment (make-vect .4 1.0) (make-vect .35 .81))
                           (make-segment (make-vect .35 .81) (make-vect .4 .62))
                           (make-segment (make-vect .4 .62) (make-vect .3 .62))
                           (make-segment (make-vect .3 .62) (make-vect .15 .58))
                           (make-segment (make-vect .15 .58) (make-vect .0 .8))
                           (make-segment (make-vect .38 .81) (make-vect .5 .81))
                           (make-segment (make-vect .5 .81) (make-vect .5 .72))
                           (make-segment (make-vect .53 .81) (make-vect .63 .81)))))
(paint wave)


(define (up-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (up-split painter (- n 1))))
        (below painter (beside smaller smaller)))))
(define (right-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (right-split painter (- n 1))))
        (beside painter (below smaller smaller)))))
(define (corner-split painter n)
  (if (= n 0)
      painter
      (beside (below painter (up-split painter (- n 1)))
              (below (right-split painter (- n 1)) (corner-split painter (- n 1))))))

(paint (corner-split wave 5))


(define (square-of-four tl tr bl br)
  (lambda (painter)
    (let ((top (beside (tl painter) (tr painter)))
          (bottom (beside (bl painter) (br painter))))
      (below bottom top))))
(define (square-limit painter n)
  (let ((combine4 (square-of-four flip-vert rotate180
                                  identity flip-horiz)))
    (combine4 (corner-split painter n))))

(paint (square-limit wave 5))