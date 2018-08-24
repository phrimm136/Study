(define (count-change money)
  (define (count-change-recur a n)
    (cond ((= a 0) 1)
          ((< a 0) 0)
          ((= n 0) 0)
          (else (+ (count-change-recur (- a (kind-of n)) n) (count-change-recur a (- n 1))))))
  (define (kind-of coin)
    (cond ((= coin 5) 50)
          ((= coin 4) 25)
          ((= coin 3) 10)
          ((= coin 2) 5)
          (else 1)))
  (count-change-recur money 5))

(count-change 11)

;    11
;  ┌--┴----┐
; 50      25
;  |       |
; -39     11
;       ┌--┴--┐ 
;      25    10
;       |     |
;      -14   11
;          ┌--┴-------------┐
;         10                5
;          |                |
;          1               11
;        ┌-┴-┐            ┌-┴---------------------┐
;       10   5            5                       1
;        |   |            |                       |
;       -9   1            6                      11
;          ┌-┴-┐        ┌-┴------------┐        ┌-┴-┐
;          5   1        5              1        1   x
;          |   |        |              |        |
;         -4   1        1              6       10
;            ┌-┴-┐    ┌-┴---┐        ┌-┴-┐    ┌-┴-┐
;            1   x    5     1        1   x    1   x
;            |        |     |        |        |
;            0       -4     1        5        9
;                         ┌-┴-┐    ┌-┴-┐    ┌-┴-┐
;                         1   x    1   x    1   x
;                         |        |        |
;                         0        4        8
;                                ┌-┴-┐    ┌-┴-┐
;                                1   x    1   x
;                                |        |
;                                3        7
;                              ┌-┴-┐    ┌-┴-┐
;                              1   x    1   x
;                              |        |
;                              2        6
;                            ┌-┴-┐    ┌-┴-┐
;                            1   x    1   x
;                            |        |
;                            1        5
;                          ┌-┴-┐    ┌-┴-┐
;                          1   x    1   x
;                          |        |
;                          0        4
;                                 ┌-┴-┐
;                                 1   x
;                                 |
;                                 3
;                               ┌-┴-┐
;                               1   x
;                               |
;                               2
;                             ┌-┴-┐
;                             1   x
;                             |
;                             1
;                           ┌-┴-┐
;                           1   x
;                           |
;                           0
;
; orders of growth of space is Θ(n)
; number of steps is Θ(n^5) 