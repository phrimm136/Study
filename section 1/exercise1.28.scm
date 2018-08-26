#lang sicp
(define (prime? n)
  (define (smallest-divisor n)
    (define (square x) (* x x))
    (define (find-divisor n test-divisor)
      (cond ((> (square test-divisor) n) n)
            ((divides? test-divisor n) test-divisor)
            (else (find-divisor n (+ test-divisor 1)))))
    (define (divides? a b)
      (= (remainder b a) 0))
    (find-divisor n 2))
  (= n (smallest-divisor n)))

(define (fast-prime? n times)
  (define (square x) (* x x))
  (define (miller-rabin-test n)
    (define (nontrivial root)
      (cond ((and (not (or (= root 1) (= root (- n 1)))) (= (remainder (square root) n) 1)) 0)
            (else (square root))))
    (define (expmod base exp m)
      (cond ((= exp 0) 1)
            ((even? exp)
             (remainder (nontrivial (expmod base (/ exp 2) m))
                        m))
            (else
             (remainder (* base (expmod base (- exp 1) m))
                        m))))
    (define (try-it a)
      (= (expmod a (- n 1) n) 1))
    (try-it (+ 1 (random (- n 1)))))
  (cond ((= times 0) true)
        ((miller-rabin-test n) (fast-prime? n (- times 1)))
        (else false)))

(display (prime? 561))
(display (fast-prime? 561 100))
(newline)
(display (prime? 1105))
(display (fast-prime? 1105 100))
(newline)
(display (prime? 1729))
(display (fast-prime? 1729 100))
(newline)
(display (prime? 2465))
(display (fast-prime? 2465 100))
(newline)
(display (prime? 2821))
(display (fast-prime? 2821 100))
(newline)
(display (prime? 6601))
(display (fast-prime? 6601 100))