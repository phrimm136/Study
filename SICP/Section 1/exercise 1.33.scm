#lang sicp
(define (filtered-accumulate combiner null-value term a next b filter?)
  (if (> a b) null-value (if (filter? a)
                             (combiner (term a) (filtered-accumulate combiner null-value term (next a) next b filter?))
                             (filtered-accumulate combiner null-value term (next a) next b filter?))))

(define (prime? n)
  (define (smallest-divisor n)
    (define (find-divisor n test-divisor)
      (cond ((> (square test-divisor) n) n)
            ((divides? test-divisor n) test-divisor)
            (else (find-divisor n (+ test-divisor 1)))))
    (define (divides? a b)
      (= (remainder b a) 0))
    (find-divisor n 2))
  (= n (smallest-divisor n)))

(define (square x) (* x x))
(define (identity x) x)

(define (sum-of-primes a b)
  (filtered-accumulate + 0 square a inc b prime?))


(define (product-of-relatively-primes n)
  (define (GCD1? i)
    (define (GCD a b)
      (if (= b 0) a (GCD b (remainder a b))))
    (= (GCD i n) 1))
  (filtered-accumulate * 1 identity 1 inc n GCD1?))

(sum-of-primes 2 10)
(product-of-relatively-primes 10)

