(define (square x) (* x x))

(define (my-sqrt x)
  (define (sqrt-iter improved-guess guess)
    (if (good-enough? improved-guess guess) improved-guess (sqrt-iter (improve improved-guess) improved-guess)))
  (define (improve guess)
    (define (average x y) (/ (+ x y) 2))
    (average guess (/ x guess)))
  (define (good-enough? improved-guess guess)
    (< (abs (- improved-guess guess)) 0.001))
  (sqrt-iter 1.0 0.0))

(square (my-sqrt 0.0009))