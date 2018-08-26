#lang sicp
(#%require (lib "27.ss" "srfi"))
(define (search-for-primes n count)
  (define (timed-prime-test n)
    (define (start-prime-test n start-time)
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
      (define (report-prime elapsed-time)
        (newline)
        (display n)
        (display " *** ")
        (display elapsed-time))
      (if (prime? n) (report-prime (- (runtime) start-time)) false))
    (start-prime-test n (runtime)))
  (cond ((= count 0) (newline))
        ((= (remainder n 2) 0) (search-for-primes (+ 1 n) count))
        ((not (timed-prime-test n)) (search-for-primes (+ 2 n) count))
        (else (search-for-primes (+ 2 n) (- count 1)))))

(search-for-primes 1000000000 3)
; 1000000007 *** 2974
; 1000000009 *** 2976
; 1000000021 *** 2975

(search-for-primes 10000000000 3)
; 10000000019 *** 9465
; 10000000033 *** 9418
; 10000000061 *** 8971

(search-for-primes 100000000000 3)
; 100000000003 *** 29264
; 100000000019 *** 31743
; 100000000057 *** 29758

(search-for-primes 1000000000000 3)
; 1000000000039 *** 127967
; 1000000000061 *** 99698
; 1000000000063 *** 132432

; Showing √10 times increment as long as digits increase