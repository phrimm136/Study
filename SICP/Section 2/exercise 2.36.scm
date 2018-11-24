#lang sicp
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (accumulate-n op initial sequences)
  (if (null? (car sequences))
      nil
      (cons (accumulate op initial (map (lambda (x) (append (car x))) sequences))
            (accumulate-n op initial (map (lambda (x) (append (cdr x))) sequences)))))

(define s (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))

(accumulate-n + 0 s)