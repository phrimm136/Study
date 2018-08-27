#lang sicp
(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (simpson-iter k)
    (if (> k n) 0 (cond ((or (= k 0) (= k n)) (+ (f (+ a (* k h))) (simpson-iter (+ k 1))))
                        ((even? k) (+ (* 2 (f (+ a (* k h)))) (simpson-iter (+ k 1))))
                        (else (+ (* 4 (f (+ a (* k h)))) (simpson-iter (+ k 1)))))))
  (* (/ h 3) (simpson-iter 0)))

(define (cube x) (* x x x))

(define (integral a b n)
  (simpson cube a b n))

(integral 0 1 100)