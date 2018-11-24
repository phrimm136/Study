#lang sicp
(define (square x) (* x x))
(define (square-tree tree) (tree-map square tree))
(define (tree-map f tree)
  (map (lambda (sub-tree)
         (if (not (pair? sub-tree))
             (f sub-tree)
             (tree-map f sub-tree)))
       tree))

(square-tree (list 1 (list 2 (list 3 4) 5) (list 6 7)))