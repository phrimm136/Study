(define (inc x) (- x -1))
(define (dec x) (- x 1))

(define (+ a b)
  (if (= a 0) b (inc (+ (dec a ) b))))

(+ 2 3)

; This process is recursive (not tail recursion)

(define (+ a b)
  (if (= a 0) b (+ (dec a) (inc b))))

(+ 2 3)

;This process is iterative (tail recursion)