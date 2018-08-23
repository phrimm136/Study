(define (square x) (* x x))
(define (cube x) (* x x x))

(define (cube-root x)
  (define (cube-root-iter improved-guess guess)
    (if (good-enough? improved-guess guess) improved-guess
                                            (cube-root-iter (improve improved-guess) improved-guess)))
  (define (improve guess)
    (/ (+ (/ x (square guess)) (* 2 guess)) 3))
  (define (good-enough? improved-guess guess)
    (< (abs (- improved-guess guess)) 0.001))

  (cube-root-iter 1.0 0.0))

(cube-root 27)