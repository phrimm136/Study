#lang sicp
(define n 6)
(define s 5)

(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))
(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (ordered-triples n)
  (flatmap (lambda (i) (flatmap (lambda (j) (map (lambda (k) (list i j k))
                                             (enumerate-interval 1 n)))
                            (enumerate-interval 1 n)))
           (enumerate-interval 1 n)))
(define (unique-triples n s)
  (filter (lambda (triple) (= (accumulate + 0 triple) s)) (ordered-triples n)))

(define (get-triples n s)
  (map append (unique-triples n s)))

(get-triples n s)