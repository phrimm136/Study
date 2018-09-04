(define (square-sum-larger a b c)
  (define (square x) (* x x))
  (define (>= x y) (not (< x y)))
  (define (least a b c)
    (if (>= (if (>= a b) b a) c) c (if (>= a b) b a)))

  (- (+ (square a) (square b) (square c)) (square (least a b c))))

(square-sum-larger 1 2 3)