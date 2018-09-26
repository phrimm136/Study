#lang sicp
(define (make-leaf symbol weight)
  (list 'leaf symbol weight))
(define (leaf? object)
  (eq? (car object) 'leaf))
(define (symbol-leaf x) (cadr x))
(define (weight-leaf x) (caddr x))
(define (make-code-tree left right)
  (list left right (append (symbols left) (symbols right)) (+ (weight left) (weight right))))
(define (left-branch tree) (car tree))
(define (right-branch tree) (cadr tree))
(define (symbols tree) (if (leaf? tree) (list (symbol-leaf tree)) (caddr tree)))
(define (weight tree) (if (leaf? tree) (weight-leaf tree) (cadddr tree)))


(define (decode bits tree)
  (define (decode-1 bits current-branch)
    (if (null? bits)
        '()
        (let ((next-branch (choose-branch (car bits) current-branch)))
          (if (leaf? next-branch)
              (cons (symbol-leaf next-branch) (decode-1 (cdr bits) tree))
              (decode-1 (cdr bits) next-branch)))))
  (decode-1 bits tree))
(define (choose-branch bit branch)
  (cond ((= bit 0) (left-branch branch))
        ((= bit 1) (right-branch branch))
        (else (error "bad bit -- CHOOSE-BRANCH" bit))))


(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< (weight x) (weight (car set))) (cons x set))
        (else (cons (car set) (adjoin-set x (cdr set))))))
(define (make-leaf-set pairs)
  (if (null? pairs)
      '()
      (let ((pair (car pairs)))
        (adjoin-set (make-leaf (car pair)    ; symbol
                               (cadr pair))  ; frequency
                    (make-leaf-set (cdr pairs))))))
(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))
(define (successive-merge leaves)
  (if (null? (cdr leaves))
      (car leaves)
      (successive-merge (adjoin-set (make-code-tree (car leaves) (cadr leaves)) (cddr leaves)))))


(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree) (encode (cdr message) tree))))
(define (encode-symbol symbol tree)
  (define (search-symbol symbol current-tree bits)
    (cond ((leaf? current-tree) (if (eq? (symbol-leaf current-tree) symbol) bits '()))
          (else (append (search-symbol symbol (left-branch current-tree) (append bits (list 0)))
                        (search-symbol symbol (right-branch current-tree) (append bits (list 1)))))))
  (let ((result (search-symbol symbol tree '())))
    (if (null? result) (error "The symbols is not in the tree at all:" symbol) result)))


(define sample-tree (generate-huffman-tree (list (list 'A 3) (list 'B 5) (list 'C 6) (list 'D 6))))
(define sample-message '(A B C D))
(define sample-encoded (encode sample-message sample-tree))


sample-tree
sample-encoded
(decode sample-encoded sample-tree)