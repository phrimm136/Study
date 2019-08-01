(define (mystery a b)
  ((if (> b 0) + -) a b))

(mystery 4 5)


; equal (if (> b 0) (+ a b) (- a b))
; or    ((+ a (abs b))
; or    (+ a (if (> b 0) b (- b)))