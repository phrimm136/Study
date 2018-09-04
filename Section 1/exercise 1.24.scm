#lang sicp
(#%require (lib "27.ss" "srfi"))
(define (search-for-primes n count)
  (define (timed-prime-test n)
    (define (start-prime-test n start-time)
      (define (fast-prime? n times)
        (define (square x) (* x x))
        (define (fermat-test n)
          (define (expmod base exp m)
            (cond ((= exp 0) 1)
                  ((even? exp)
                   (remainder (square (expmod base (/ exp 2) m))
                              m))
                  (else
                   (remainder (* base (expmod base (- exp 1) m))
                              m))))
          (define (try-it a)
            (= (expmod a n n) a))
          (try-it (+ 1 (random-integer (- n 1)))))
        (cond ((= times 0) true)
              ((fermat-test n) (fast-prime? n (- times 1)))
              (else false)))
      (define (report-prime elapsed-time)
        (newline)
        (display n)
        (display " *** ")
        (display elapsed-time))
      (if (fast-prime? n 100) (report-prime (- (runtime) start-time)) false))
    (start-prime-test n (runtime)))
  (cond ((= count 0) (newline))
        ((= (remainder n 2) 0) (search-for-primes (+ 1 n) count))
        ((not (timed-prime-test n)) (search-for-primes (+ 2 n) count))
        (else (search-for-primes (+ 2 n) (- count 1)))))

(search-for-primes 1000000000 3)
; 1000000007 *** 496
; 1000000009 *** 496
; 1000000021 *** 496

(search-for-primes 10000000000 3)
; 10000000019 *** 2027
; 10000000033 *** 1999
; 10000000061 *** 2480

(search-for-primes 100000000000 3)
; 100000000003 *** 2976
; 100000000019 *** 2976
; 100000000057 *** 3018

(search-for-primes 1000000000000 3)
; 1000000000039 *** 3433
; 1000000000061 *** 2977
; 1000000000063 *** 4464

; Showing logarithmic scale