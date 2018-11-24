(define (pascal row col)
  (cond ((or (> col row) (< col 0) (< row 0)) 0)
        ((or (= row col) (= col 0)) 1)
        (else (+ (pascal (- row 1) (- col 1)) (pascal (- row 1) col)))))

(pascal 5 2)