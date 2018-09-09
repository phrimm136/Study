#lang sicp
(define (square-tree tree)
  (define (square x) (* x x))
  (map (lambda (sub-tree)
         (if (not (pair? sub-tree))
             (square sub-tree)
             (square-tree sub-tree)))
       tree))

(square-tree (list 1 (list 2 (list 3 4) 5) (list 6 7)))