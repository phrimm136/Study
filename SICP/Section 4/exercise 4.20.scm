#lang sicp
(define (f x)
  (letrec ((even? (lambda (n) (if (= n 0)
                                  true
                                  (odd? (- n 1)))))
           (odd? (lambda (n) (if (= n 0)
                                 false
                                 (even? (- n 1))))))
    (cond ((even? x) 'even)
          ((odd? x) 'odd))))

(f 5)


(define (letrec? exp) (tagged-list? exp 'letrec))

(define (letrec-variables exp) (map car (cadr exp)))
(define (letrec-expressions exp) (map cadr (cadr exp)))
(define (make-variables variables)
  (if (null? variables)
      nil
      (cons (list (car variables) '*unattached)
            (make-variables (cdr variables)))))
(define (set-variables! variables expressions)
  (if (null? variables)
      nil
      (cons (list 'set! (car variables) (car expressions))
            (set-variables! (cdr variables) (cdr expressions)))))
(define (letrec-body exp) (cddr exp))
(define (letrec->let exp)
  (list 'let
        (make-variables (letrec-variables exp))
        (make-begin (append (set-variables! (letrec-variables exp) (letrec-expressions exp))
                            (letrec-body exp)))))

; Implemented as shown in the text above.


; When evaluating even? in an envionment of let ver., odd? isn't yet bound, so it causes error.
; But in letrec ver., odd? is bound as *unassigned*, so even? can see odd?.