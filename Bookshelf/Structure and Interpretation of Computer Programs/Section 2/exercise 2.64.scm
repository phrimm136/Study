#lang sicp
(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))

(define (list->tree elements)
  (car (partial-tree elements (length elements))))
(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size (quotient (- n 1) 2)))
        (let ((left-result (partial-tree elts left-size)))
          (let ((left-tree (car left-result))
                (non-left-elts (cdr left-result))
                (right-size (- n (+ left-size 1))))
            (let ((this-entry (car non-left-elts))
                  (right-result (partial-tree (cdr non-left-elts)
                                              right-size)))
              (let ((right-tree (car right-result))
                    (remaining-elts (cdr right-result)))
                (cons (make-tree this-entry left-tree right-tree)
                      remaining-elts))))))))

(list->tree (list 1 2 3 4 5 6 7))

; (1 2 3 4 5 6 7) 7
; left-size: 3
;   (1 2 3) 3
;   left-size: 1
;     (1) 1
;     left-size: 0
;       '()
;     right-size: 0
;       '()
;     (1 '() '())
;   right-size: 1
;     (3) 1
;     left-size: 0
;       '()
;     right-size: 0
;       '()
;     (3 '() '())
;   (2 (1 '() '()) (3 '() '()))
; right-size: 3
;   (5 6 7) 3
;   left-size: 1
;     (5) 1
;     left-size: 0
;       '()
;     right-size: 0
;       '()
;     (5 '() '())
;   right-size: 1
;     (7) 1
;     left-size: 0
;       '()
;     right-size: 0
;       '()
;     (7 '() '())
;   (6 (5 '() '()) (7 '() '()))
; (4 (2 (1 '() '()) (3 '() '())) (6 (5 '() '()) (7 '() '())))

; Number of steps is proportional to the size of the list, so O(n).