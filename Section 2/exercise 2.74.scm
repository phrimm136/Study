#lang sicp
(define global-array '())
(define (make-entry k v) (list k v))
(define (key entry) (car entry))
(define (value entry) (cadr entry))
(define (put op type item)
  (define (put-helper k array)
    (cond ((null? array) (list (make-entry k item)))
          ((equal? (key (car array)) k) array)
          (else (cons (car array) (put-helper k (cdr array))))))
  (set! global-array (put-helper (list op type) global-array)))
(define (get op type)
  (define (get-helper k array)
    (cond ((null? array) #f)
          ((equal? (key (car array)) k) (value (car array)))
          (else (get-helper k (cdr array)))))
  (get-helper (list op type) global-array))
; get/put


(define (get-record name division)
  ((get division 'record) name)) ; '(A-division ((name John) (salary 20000)) ((name Susan) (salary 17000)))


(define (get-salary record division)
  ((get division 'salary) record))


(define (find-employee-record name division-list)
  (if (null? division-list)
      (error nil)
      (append (get-record name (car division-list)) (find-employee-record (cdr division-list)))))

; We must provide an installation package for new division which includes 'record and 'salary generics.