(define nil '())
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


(define (queens board-size)
  (define empty-board nil)
  (define (adjoin-position row rest-of-queens)
    (define (iter idx)
      (cond ((< board-size idx) nil)
            ((= idx row) (cons 1 (iter (+ idx 1))))
            (else (cons 0 (iter (+ idx 1))))))
    (cons (iter 1) rest-of-queens))
  (define (safe? positions)
    (define (idx-make new-low)
      (if (= (car new-low) 0) (+ 1 (idx-make (cdr new-low))) 1))
    (define (idx-search idx old-row)
      (if (= idx 1) (car old-row) (idx-search (- idx 1) (cdr old-row))))
    (let ((idx (idx-make (car positions))))
      (define (column-test old-rows)
        (cond ((null? old-rows) true)
              ((= (idx-search idx (car old-rows)) 1) false)
              (else (column-test (cdr old-rows)))))
      (define (diagonal-test old-rows)
        (define (iter1 idx old-rows)
          (cond ((null? old-rows) true)
                ((= idx 0) true)
                ((= (idx-search idx (car old-rows)) 1) false)
                (else (iter1 (- idx 1) (cdr old-rows)))))
        (define (iter2 idx old-rows)
          (cond ((null? old-rows) true)
                ((> idx board-size) true)
                ((= (idx-search idx (car old-rows)) 1) false)
                (else (iter2 (+ idx 1) (cdr old-rows)))))
        (and (iter1 (- idx 1) old-rows) (iter2 (+ idx 1) old-rows)))
      (and (column-test (cdr positions)) (diagonal-test (cdr positions)))))
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter (lambda (positions)
                  (safe? positions))
                (flatmap (lambda (rest-of-queens)
                           (map (lambda (new-row)
                                  (adjoin-position new-row rest-of-queens))
                                (enumerate-interval 1 board-size)))
                         (queen-cols (- k 1))))))
  (queen-cols board-size))

(define (display-maps maps)
  (if (null? maps)
      (display "")
      (let ((first (car maps))
            (rests (cdr maps)))
        (define (iter map)
          (if (null? map)
              (newline)
              (begin (display (car map))
                     (newline)
                     (iter (cdr map)))))
        (iter first)
        (display-maps rests))))

(display-maps (queens 8))
