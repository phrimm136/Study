(define (mul a b)
  (define (double x) (+ x x))
  (define (halve x) (/ x 2))
  (define (even? n) (= (remainder n 2) 0))
  (cond ((= b 0) 0)
        ((even? b) (double (mul a (halve b))))
        (else (+ a (mul a (- b 1))))))

(mul 2 4)