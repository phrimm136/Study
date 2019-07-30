#lang sicp
(define (assoc same-key? key records)
  (cond ((null? records) false)
        ((same-key? key (caar records)) (car records))
        (else (assoc same-key? key (cdr records)))))


(define (one-digit-interval-tolerance k1 k2)
  (if (and (number? k1) (number? k2))
      (< (abs (- k1 k2)) 10)
      (equal? k1 k2)))


(define (make-table same-key?)
  (let ((local-table (list '*table*)))
    (define (lookup key-1 key-2)
      (let ((subtable (assoc same-key? key-1 (cdr local-table))))
        (if subtable
            (let ((record (assoc same-key? key-2 (cdr subtable))))
              (if record
                  (cdr record)
                  false))
            false)))
    (define (insert! key-1 key-2 value)
      (let ((subtable (assoc same-key? key-1 (cdr local-table))))
        (if subtable
            (let ((record (assoc same-key? key-2 (cdr subtable))))
              (if record
                  (set-cdr! record value)
                  (set-cdr! subtable (cons (cons key-2 value) (cdr subtable)))))
            (set-cdr! local-table (cons (list key-1 (cons key-2 value)) (cdr local-table)))))
      'ok)
    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
            ((eq? m 'insert-proc!) insert!)
            (else (error "Unknown operation - TABLE" m))))
    dispatch))


(define operation-table (make-table one-digit-interval-tolerance))
(define get (operation-table 'lookup-proc))
(define put (operation-table 'insert-proc!))

(put 1001 232 1)
(get 1002 233)
(get 1020 232)