#lang sicp
(define (make-table)
  (let ((local-table (list '*table*)))
    (define (lookup key-list)
      (let ((subtable (assoc (car key-list) (cdr local-table))))
        (if subtable
            (if (not (null? (cdr key-list)))
                (let ((record (assoc (cadr key-list) (cdr subtable))))
                  (if record
                      (cdr record)
                      false))
                (if (not (pair? (cdr subtable)))
                    (cdr subtable)
                    (error "Need more keys" key-list)))
            false)))
    (define (insert! key-list value)
      (let ((subtable (assoc (car key-list) (cdr local-table))))
        (if subtable
            (if (not (null? (cdr key-list)))
                (let ((record (assoc (cadr key-list) (cdr subtable))))
                  (if record
                      (set-cdr! record value)
                      (set-cdr! subtable (cons (cons (cadr key-list) value) (cdr subtable)))))
                (set-cdr! subtable value))
            (if (not (null? (cdr key-list)))
                (set-cdr! local-table (cons (list (car key-list) (cons (cadr key-list) value))
                                            (cdr local-table)))
                (set-cdr! local-table (cons (cons (car key-list) value) (cdr local-table))))))
      'ok)
    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
            ((eq? m 'insert-proc!) insert!)
            (else (error "Unknown operation - TABLE" m))))
    dispatch))


(define operation-table (make-table))
(define get (operation-table 'lookup-proc))
(define put (operation-table 'insert-proc!))

(put (list 1001 232) 1)
(get (list 1001 232))
(put (list 101) 2)
(get (list 101))