#lang sicp
(#%require sicp-pict)

(define outline
  (segments->painter (list (make-segment (make-vect .0 .0) (make-vect .0 .98))
                           (make-segment (make-vect .0 .98) (make-vect .98 .98))
                           (make-segment (make-vect .98 .98) (make-vect .98 .0))
                           (make-segment (make-vect .98 .0) (make-vect .0 .0)))))
(paint outline)

(define X
  (segments->painter (list (make-segment (make-vect .0 .0) (make-vect 1.0 1.0))
                           (make-segment (make-vect 1.0 .0) (make-vect .0 1.0)))))
(paint X)

(define diamond
  (segments->painter (list (make-segment (make-vect .0 .5) (make-vect .5 1.0))
                           (make-segment (make-vect .5 1.0) (make-vect 1.0 .5))
                           (make-segment (make-vect 1.0 .5) (make-vect .5 .0))
                           (make-segment (make-vect .5 .0) (make-vect .0 .5)))))
(paint diamond)

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
                           (make-segment (make-vect .15 .58) (make-vect .0 .8)))))
(paint wave)