#lang sicp
(define (make-table)
  (let ((local-table (list '*table*)))
    (define (lookup key-list)
      (define (iter rest-keys table)
        (cond ((null? rest-keys) false)
              ((null? (cdr rest-keys)) (let ((record (assoc (car rest-keys) (cdr table))))
                                              (if record
                                                  (cdr record)
                                                  false)))
              (else (let ((sub-table (assoc (car rest-keys) (cdr table))))
                      (if sub-table
                          (iter (cdr rest-keys) sub-table)
                          false)))))
      (iter key-list local-table))
    (define (insert! key-list value)
      (define (iter rest-keys table)
        (cond ((null? table) (if (null? (cdr rest-keys))
                                 (cons (car rest-keys) value)
                                 (list (car rest-keys) (iter (cdr rest-keys) '()))))
              ((null? (cdr rest-keys)) (let ((record (assoc (car rest-keys) (cdr table))))
                                              (if record
                                                  (set-cdr! record value)
                                                  (set-cdr! table
                                                            (cons (cons (car rest-keys) value)
                                                                  (cdr table))))))
              (else (let ((sub-table (assoc (car rest-keys) (cdr table))))
                      (if sub-table
                          (iter (cdr rest-keys) sub-table)
                          (set-cdr! table (cons (list (car rest-keys) (iter (cdr rest-keys) '()))
                                                (cdr table))))))))
        (iter key-list local-table)
      'ok)
    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
            ((eq? m 'insert-proc!) insert!)
            (else (error "Unknown operation - TABLE" m))))
    dispatch))


(define operation-table (make-table))
(define get (operation-table 'lookup-proc))
(define put (operation-table 'insert-proc!))

(put (list 1001 232 44) 0)
(get (list 1001 232 44))
(put (list 1001 232) 1)
(get (list 1001 232))
(put (list 101) 2)
(get (list 101))