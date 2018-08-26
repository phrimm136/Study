#lang sicp
(#%require (lib "27.ss" "srfi"))
(define (search-for-primes n count)
  (define (timed-prime-test n)
    (define (start-prime-test n start-time)
      (define (prime? n)
        (define (smallest-divisor n)
          (define (square x) (* x x))
          (define (next test-divisor)
            (if (= test-divisor 2) 3 (+ 2 test-divisor)))
          (define (find-divisor n test-divisor)
            (cond ((> (square test-divisor) n) n)
                  ((divides? test-divisor n) test-divisor)
                  (else (find-divisor n (next test-divisor)))))
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
; 1000000007 *** 1983
; 1000000009 *** 1486
; 1000000021 *** 1981

(search-for-primes 10000000000 3)
; 10000000019 *** 5456
; 10000000033 *** 5455
; 10000000061 *** 5456

(search-for-primes 100000000000 3)
; 100000000003 *** 17360
; 100000000019 *** 17856
; 100000000057 *** 17857

(search-for-primes 1000000000000 3)
; 1000000000039 *** 60052
; 1000000000061 *** 56056
; 1000000000063 *** 71878

; The observed ratio of the speeds of the two algorithms is 3:2, because of the if statement of next procedure.