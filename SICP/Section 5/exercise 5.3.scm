#lang sicp
(define (sqrt x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))
  (sqrt-iter 1.0))


; Abstract version

; data path

;                          / \                     ____________
;                         / 1 \                    \   read   /
;                        /_____\                    \________/
;                           |                           |
;                          (X)guess<-1                 (X)x<-read
;                           V         ___________       V
;                        +-----+     /           \    +---+
;     +(X)-------------->+guess+-----|good-enough|----+ x |
;     | guess<-improve   +--+-++     \___________/    +---+
;     |                     | |
;     |                     | +------------+
;     |                     |              |
;     |               .-----------.  .-----------. 
;     +---------------\  improve  /  \   print   /<--------(X)
;                      \_________/    \_________/           P

; controller diagram

(controllerer sqrt-loop
              (assign guess (const 1))
              (assign guess x (op read))

              test
              (test (op good-enough) (reg guess) (reg x))
              (branch sqrt-done)
              (assign guess (op improve) (reg guess))
              (goto (tabel test))

              sqrt-done
              (perform (op print) (reg guess))
              (goto (label sqrt-loop)))


; Arithmetic version

; data path

;      /'\                  /'\                     ____________
;     / 2 \                / 1 \                    \   read   /
;    /_____\              /_____\                    \________/
;       |                    |                           |
;    +--+                   (X)guess<-1                 (X)x<-read
;    |                       V                           V
;    |                    +-----+   .-------.          +---+
; +--|--(X)-------------->+guess+----\print/<--(X)     | x |
; |  |   guess<-div       ++---++     \___/     P      +-+-+
; |  +---+                 |   |                         |
; |      |                 | +-+-+                       |
; |+-+   |             +---|-|---|-------+---------------+
; || |   |   +------+------+ V   V       |
; ||.-----.  |      |  |    .-----.      |
; || \ / /   |      |  |     \ * /       |
; ||  \_/    |    .-----.     \_/        |
; ||   |     |     \ / /       |         |
; +----+     |      \_/       .-----------.
;  | +-------+       |         \    -    /
;  | |   +-----------+          \_______/    ___            /'\
;  | |   |                          |       /   \          / 0 \
;  |.-----.                         +------|  <  |--------/_____\
;  | \ + /                          |       \___/           |
;  |  \_/                           +-------------------------+
;  |   |                                                    | |
;  +---+                                                  .-----.                ___               /'\
;                                                          \ - /                /   \             /   \
;                                                           \_/     +----------|  <  |---------- /0.001\
;                                                            +------+           \___/           /_______\


; controller diagram

(controller sqrt-loop
            (assign guess (const 1))
            (assign x (op read))

            test
            (assign square (op *) (reg guess) (reg guess))
            (assign diff (op -) (reg square) (reg x))
            (test (op <) (reg diff) (const 0))
            (branch (assign diff (op -) (const 0) (reg diff)))
            (test (op <) (reg diff) (const 0.001))
            (branch (label sqrt-done))
            (assign div (op /) (reg x) (reg guess))
            (assign sum (op +) (reg guess) (reg div))
            (assign avg (op /) (reg sum) (const 2))
            (assign guess (reg avg))
            (goto (label test))

            sqrt-done
            (perform (op print) (reg guess))
            (goto (label sqrt-loop)))