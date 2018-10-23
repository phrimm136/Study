(module sicp-concurrency mzscheme
  (require (only (lib "list.ss") first rest sort cons?)
           (lib "contract.ss"))
  ;; concurrency: SICP concurrency primitives
  ;; adapted from http://list.cs.brown.edu/pipermail/plt-scheme/2002-September/000620.html
  
  ;;; Sources:
  ;;; Dorai Sitaram, "Learn Scheme in a Fixnum of Dayes", chapter 15
  ;;; Dyvig, http://www.scheme.com/tspl2d/examples.html#g2433
  (provide (all-from-except mzscheme #%app #%datum set!))
  
  
  (define (thunk? datum)
    (and (procedure? datum)
         (procedure-arity-includes? datum 0)))
  

  (define-struct cell (val))

  
  (provide/contract [make-serializer (-> ((-> any) . -> . any))]
                    [parallel-execute (() (listof thunk?) . ->* . ((listof any/c)))]
                    [make-cell (boolean? . -> . cell?)]
                    [clear! (cell? . -> . any)]
                    [test-and-set! (cell? . -> . boolean?)])
  (provide (rename timed-datum #%datum)
           (rename timed-apply #%app)
           (rename timed-set! set!))
  
  
  
  
  
  (define yield-handler (lambda () (void)))
  (define clock 0)
  
  (define (start-timer ticks new-handler)
    (set! yield-handler new-handler)
    (set! clock ticks))
  
  (define (stop-timer)
    (let ([time-left clock])
      (set! clock 0)
      time-left))
  
  (define (decrement-timer)
    (if (> clock 0)
        (begin
          (set! clock (- clock 1))
          (if (= clock 0)
              (yield-handler)))))
  
  
  (define (random-shuffle a-list)
    (map rest
         (sort (map (lambda (x) (cons (random) x)) a-list)
               (lambda (x y) (< (first x) (first y))))))
  
  (define (parallel-execute . thunks)
    (round-robin (map make-engine (random-shuffle thunks))))
  
  
  (define (dole-out-gas)
    (add1 (random 12)))
  
  (define (round-robin engs)
    (if (null? engs)
        '()
        ((car engs) (dole-out-gas)
                    (lambda (ticks value)
                      (cons value (round-robin (cdr engs))))
                    (lambda (eng)
                      (round-robin
                       (append (cdr engs) (list eng)))))))
  
  
  
  (define make-engine
    (let ([do-complete #f]
          [do-expire #f])
      (define (timer-handler)
        (start-timer (call/cc do-expire) timer-handler))
      
      (define (new-engine resume)
        (lambda (ticks complete expire)
          ((call/cc (lambda (escape)
                      (set! do-complete
                            (lambda (ticks value)
                              (escape (lambda () (complete ticks value)))))
                      (set! do-expire
                            (lambda (resume)
                              (escape (lambda () (expire (new-engine resume))))))
                      (resume ticks))))))
      (lambda (proc)
        (new-engine
         (lambda (ticks)
           (start-timer ticks timer-handler)
           (let ((value (proc)))
             (let ((ticks (stop-timer)))
               (do-complete ticks value))))))))
  
  
  (define-syntax timed-datum
    (syntax-rules ()
      [(_ . datum)
       (begin
         (decrement-timer)
         (#%datum . datum))]))
  
  (define-syntax timed-apply
    (syntax-rules ()
      ((_ operator rand ...)
       (begin
         (decrement-timer)
         (#%app (begin (decrement-timer) operator)
                (begin (decrement-timer) rand) ...)))))
  
  (define-syntax timed-set!
    (syntax-rules ()
      ((_ id expr)
       (begin
         (decrement-timer)
         (set! id (begin
                    (let ([val expr])
                      (decrement-timer)
                      val)))))))
  
  
  
  ;; The following definitions are adapted from SICP
  ;;
  ;; http://mitpress.mit.edu/sicp/full-text/book/book-Z-H-23.html#call_footnote_Temp_430
  
  (define (make-serializer)
    (let ((mutex (timed-apply make-mutex)))
      (lambda (p)
        (define (serialized-p . args)
          (timed-apply mutex 'acquire)
          (let ((val (timed-apply apply p args)))
            (timed-apply mutex 'release)
            val))
        serialized-p)))
  
  (define (make-mutex)
    (let ((cell (timed-apply make-cell #f)))
      (define (the-mutex m)
        (cond ((timed-apply eq? m 'acquire)
               (if (timed-apply test-and-set! cell)
                   (timed-apply the-mutex 'acquire)))
              ((timed-apply eq? m 'release)
               (timed-apply clear! cell))))
      the-mutex))
  
  (define (clear! cell)
    (timed-apply set-cell-val! cell #f))
  
  (define (test-and-set! cell)
    (if (cell-val cell)
        #t
        (begin (set-cell-val! cell #t)
               #f))))