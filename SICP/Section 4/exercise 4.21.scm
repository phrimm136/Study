#lang sicp
((lambda (n)
   ((lambda (fact)
      (fact fact n))
    (lambda (ft k)
      (if (= k 1)
          1
          (* k (ft ft (- k 1)))))))
 10)

; It works.


(define (f x)
  (let ((even? (lambda (n) (if (= n 0)
                               true
                               (odd? (- n 1)))))
        (odd? (lambda (n) (if (= n 0)
                              false
                              (even? (- n 1))))))
    (cond ((even? x) 'even)
          ((odd? x) 'odd))))

; to

(define (f x)
  ((lambda (even? odd?)
     (even? even? odd? x))
   (lambda (ev? od? n)
     (if (= n 0) true (od? ev? od? (- n 1))))
   (lambda (ev? od? n)
     (if (= n 0) false (ev? ev? od? (- n 1))))))

(f 5)