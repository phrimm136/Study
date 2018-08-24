(define (sine angle)
  (define (cube x) (* x x x))
  (define (p x) (- (* 3 x) (* 4 (cube x))))
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))

(sine 12.15) ; -> (p (p (p (p (p 0.05))))), p applied 5 times

; repeating dividing by 3
; number of steps and order of growth in space are proportional to log(n) => Θ(log(n))