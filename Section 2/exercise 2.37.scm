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

(define vector (list 1 2 3 4))
(define matrix (list (list 1 2 3 4) (list 4 5 6 6) (list 6 7 8 9)))
(define matrix2 (list (list 1 2) (list 1 2) (list 1 2) (list 1 2)))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(dot-product vector vector)

(define (matrix-*-vector m v)
  (map (lambda (x) (accumulate + 0 (map * v x))) m))

(matrix-*-vector matrix vector)

(define (transpose mat)
  (accumulate-n cons nil mat))

(transpose matrix)

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (x) (map (lambda (y) (accumulate + 0 (map * x y))) cols)) m)))

(matrix-*-matrix matrix matrix2)