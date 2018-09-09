#lang sicp
(define (make-mobile left right) (list left right))
(define (make-branch length structure) (list length structure))
(define (left-branch mobile) (car mobile))
(define (right-branch mobile) (car (cdr mobile)))
(define (branch-length branch) (car branch))
(define (branch-structure branch) (car (cdr branch)))

(define (total-weight mobile)
  (cond ((null? mobile) 0)
        ((not (pair? mobile)) mobile)
        (else (+ (total-weight (branch-structure (left-branch mobile)))
                 (total-weight (branch-structure (right-branch mobile)))))))

(define a (make-mobile (make-branch 2 3) (make-branch 2 4)))
(total-weight a)

(define (balanced? mobile)
  (define (torque branch) (* (branch-length branch) (total-weight (branch-structure branch))))
  (if (not (pair? mobile))
      true
      (and (= (torque (left-branch mobile)) (torque (right-branch mobile)))
           (balanced? (branch-structure (left-branch mobile)))
           (balanced? (branch-structure (right-branch mobile))))))

(define b (make-mobile (make-branch 2 (make-mobile (make-branch 2 10) (make-branch 4 5)))
                       (make-branch 10 3)))
(balanced? a)
(balanced? b)