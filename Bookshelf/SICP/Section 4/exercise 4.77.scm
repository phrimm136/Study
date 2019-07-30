#lang sicp
(define (filter? exp) 
   (or (tagged-list? exp 'not)
       (tagged-list? exp 'lisp-value)))

(define (bound? exp frame) 
   (define (tree-walk exp) 
     (cond ((var? exp) 
            (let ((binding (binding-in-frame exp frame))) 
              (if binding 
                  (tree-walk (binding-value binding)) 
                  false))) 
           ((pair? exp) 
            (or (tree-walk (car exp)) (tree-walk (cdr exp)))) 
           (else true))) 
   (tree-walk exp))


(define (conjoin conjuncts frame-stream)
  (conjoin-mix conjuncts '() frame-stream))
(define (conjoin-mix conjuncts delayed-conjuncts frame-stream)
  (define (enough-to-eval delayed rest frame-stream)
    (cond ((null? delayed) the-empty-stream)
          ((bound? (first-conjunct delayed) frame-stream) (conjoin-mix conjuncts
                                                          (append (rest-conjuncts delayed) rest)
                                                          (qeval (first-conjunct delayed) frame-stream)))
          (else (enough-to-eval (rest-conjuncts delayed)
                                (append (list (first-conjunct conjuncts)) rest)))))
  (cond ((empty-conjunction? conjuncts) (if (empty-conjunction? delayed-conjuncts)
                                            frame-stream
                                            (enough-to-eval delayed-conjuncts '() frame-stream)))
        ((filter? (first-conjunct conjuncts)) (conjoin-mix (rest-conjuncts conjuncts)
                                                           (append (list (first-conjunct conjuncts)) delayed-conjuncts)
                                                           frame-stream))
        (else (conjoin-mix (rest-conjuncts conjuncts)
                           delayed-conjuncts
                           (qeval (first-conjunct conjuncts) frame-stream)))))