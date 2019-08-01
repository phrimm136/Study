#lang sicp
(define (count-leaves tree)
  (cond ((null? tree) 0)
        ((not (pair? tree)) 1)
        (else (+ (count-leaves (car tree))
                 (count-leaves (cdr tree))))))

(controller (assign count (const 0))
            (assign continue (label tree-end))

            tree-loop
            (test (op null?) (reg tree))
            (branch (label branch-end))
            (test (op pair?) (reg tree))
            (branch (label left))
            (assign count (const 1))
            (goto (reg continue))

            left
            (save continue)
            (assign continue (label right))
            (save tree)
            (assign tree (op car) (reg tree))
            (goto (label tree-loop))

            right
            (restore tree)
            (save count)
            (assign continue (label small-tree-end))
            (assign tree (op cdr) (reg tree))
            (goto (label tree-loop))

            small-tree-end
            (assign n (reg count))
            (restore count)
            (assign count (op +) (reg n) (reg count))
            (restore continue)
            (goto (reg continue))

            branch-end
            (assign count (const 0))
            (goto (reg continue))

            tree-end)


(define (count-leaves tree)
  (define (count-iter tree n)
    (cond ((null? tree) n)
          ((not (pair? tree)) (+ n 1))
          (else (count-iter (cdr tree)
                            (count-iter (car tree) n)))))
  (count-iter tree 0))

(controller (assign count (const 0))
            (assign continue (label tree-end))

            tree-loop
            (test (op null?) (reg tree))
            (branch (label branch-end))
            (test (op pair?) (reg tree))
            (branch (label right))
            (assign count (op +) (reg count) (const 1))
            (goto (reg continue))

            left
            (restore tree)
            (assign tree (op car) (reg tree))
            (assign continue (label small-tree-end))
            (goto (label tree-loop))

            right
            (save continue)
            (assign continue (label left))
            (save tree)
            (assign tree (op cdr) (reg tree))
            (goto (label tree-loop))
            
            branch-end
            (goto (reg continue))

            small-tree-end
            (restore continue)
            (goto (reg continue))

            tree-end)
