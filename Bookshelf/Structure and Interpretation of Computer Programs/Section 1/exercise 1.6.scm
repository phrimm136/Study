(define (square x) (* x x))

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt x)
  (define (sqrt-iter guess)
    (new-if (good-enough? guess) guess (sqrt-iter (improve guess))))
  (define (improve guess)
    (define (average x y) (/ (+ x y) 2))
    (average guess (/ x guess)))
  (define (good-enough? guess)
    (define (abs x) (if (< x 0) (- x) x))
    (< (abs (- (square guess) x)) 0.001))
  (sqrt-iter 1.0))

(square (sqrt 1000))

;Infinite loop: new-if evaluates all its arguments