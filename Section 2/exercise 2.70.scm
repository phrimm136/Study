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


(define encode-tree (generate-huffman-tree (list (list 'a 2) (list 'na 16) (list 'boom 1) (list 'Sha 3)
                                                 (list 'Get 2) (list 'yip 9) (list 'job 2) (list 'Wah 1))))
(define lyric1 '(Get a job))
(define lyric2 '(Sha na na na na na na na na))
(define lyric3 '(Wah yip yip yip yip yip yip yip yip yip))
(define lyric4 '(Sha boom))
(define encoded (append (encode lyric1 encode-tree) (encode lyric2 encode-tree)
                        (encode lyric1 encode-tree) (encode lyric2 encode-tree)
                        (encode lyric3 encode-tree) (encode lyric4 encode-tree)))
; 111111100111101110000000001111111001111011100000000011010101010101010101010111011011 - 84 bits
(define decoded (decode encoded encode-tree))

; Eight-symbol can be expressed with three bits (2^3) in fixed-length code.
; The smallest number of bits is 3 * 36 = 108 bits