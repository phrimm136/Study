#lang sicp
; A label pushed earlier is scanned earlier, so (goto (label here)) moves counter to the first here and register a will be 3.


(define (extract-labels text receive)
  (if (null? text)
      (receive '() '())
      (extract-labels (cdr text)
                      (lambda (insts labels)
                        (let ((next-inst (car text)))
                          (if (symbol? next-inst)
                              (if (assoc next-inst labels)
                                  (error "Duplicate label detected - " next-inst)
                                  (receive insts
                                           (cons (make-label-entry next-inst insts) labels)))
                              (receive (cons (make-instruction next-inst) insts)
                                       labels)))))))