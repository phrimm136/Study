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


(define (=number? vari cons) (and (number? vari) (= vari cons)))
(define (variable? x) (symbol? x))
(define (same-variable? x1 x2) (and (variable? x1) (variable? x2) (eq? x1 x2)))


(define (install-dif-package)
  (define (addend s) (car s))
  (define (augend s) (cadr s))
  (define (make-sum a1 a2)
    (cond ((=number? a1 0) a2)
          ((=number? a2 0) a1)
          ((and (number? a1) (number? a2)) (+ a1 a2))
          (else (list '+ a1 a2))))
  
  (define (multiplier p) (car p))
  (define (multiplicand p) (cadr p))
  (define (make-product m1 m2)
    (cond ((or (=number? m1 0) (=number? m2 0)) 0)
          ((=number? m1 1) m2)
          ((=number? m2 1) m1)
          ((and (number? m1) (number? m2)) (* m1 m2))
          (else (list '* m1 m2))))
  
  (define (base a) (car a))
  (define (exponent a) (cadr a))
  (define (make-exponentiation e1 e2)
    (cond ((or (=number? e1 0) (=number? e1 1)) e1)
          ((and (=number? e1 0) (=number? e2 0)) (error "0 power 0 is undefined"))
          ((=number? e2 0) 1)
          ((=number? e2 1) e1)
          ((and (number? e1) (number? e2)) (expt e1 e2))
          (else (list '** e1 e2))))

  (put 'deriv '+ (lambda (exp var) (make-sum (deriv (addend exp) var)
                                             (deriv (augend exp) var))))
  (put 'deriv '* (lambda (exp var) (make-sum (make-product (multiplier exp) (deriv (multiplicand exp) var))
                                             (make-product (deriv (multiplier exp) var) (multiplicand exp)))))
  (put 'deriv '** (lambda (exp var) (make-product (make-product (exponent exp)
                                                                (make-exponentiation (base exp)
                                                                                     (dec (exponent exp))))
                                                  (deriv (base exp) var))))
  'done)


(define (operator exp) (car exp))
(define (operands exp) (cdr exp))
(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        (else ((get 'deriv (operator exp)) (operands exp) var))))

(install-dif-package)

(deriv '(+ x x) 'x)
(deriv '(* x x) 'x)
(deriv '(** x 3) 'x)

; The predicates number? and same-variable? can't be assimilated into the dispatch
; because there are nothing to dispatch.

; ((get (operator exp) 'deriv) (operands exp) var)
; Changing the arguments of put procedure.