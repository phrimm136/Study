#lang sicp
; Recursive
(define (expt b n)
  (if (= n 0)
      1
      (* b (expt b (- n 1)))))

; data-path

;          +-(X)---+        +-(X)-----+
;          V 1->b  |        V - ->n   |       ___ 
;       +-----+    |     +-----+      |      /   \             /'\
; +(X)->| val |    |     |  n  +------------|  =  |-----------/ 0 \
; |*->b +---+-+    |     +--+--+      |      \___/           /_____\
; |         |      +------+ |   +---+ |
; |         |      |      | |   | b | |
; |         |      |  +-----+   +-+-+ |  +-----+
; |      +------------------------+   |  |stack|
; |      |  |      |  |   |           |  +-+-+-+
; |    .-------.   |.-------.         |    | ^
; |     \  *  /    | \  -  /          | rc(x)|
; |      \___/     |  \___/           |    |(x)sc
; |        |       |    |             |    V |
; +--------+      /'\   +-------------+  +--------+
;                / 1 \                   |continue+--------->controller
;               /_____\                  +--+--+--+
;                                           ^  ^
;                                          (X)(X)
;                                           |  +------------/\
;                                          /'\             /__\exp-done
;                                         /___\after-exp

; controller diagram

(controller (assign continue (label exp-done))

            exp-loop
            (test (op =) (reg n) (const 0))
            (branch (label base-case))
            (save continue)
            (assign continue (label after-exp))
            (assign n (op -) (reg n) (const 1))
            (goto (label exp-loop))

            after-loop
            (restore continue)
            (assign val (op *) (reg val) (reg b))
            (goto (reg continue))

            base-case
            (assign val (const 1))
            (goto (reg continue))

            exp-done)


; Iterative
(define (expt b n)
  (define (expt-iter counter product)
    (if (= counter 0)
        product
        (expt-iter (- counter 1) (* b product))))
  (expt-iter n 1))

; data-path

;          +-(X)---+        +-(X)-----+
;          V 1->b  |        V - ->n   |       ___ 
;       +-----+    |     +-----+      |      /   \             /'\
; +(X)->|  p  |    |     |  n  +------------|  =  |-----------/ 0 \
; |*->b +---+-+    |     +--+--+      |      \___/           /_____\
; |         |      +------+ |   +---+ |
; |         |      |      | |   | b | |
; |         |      |  +-----+   +-+-+ |
; |      +------------------------+   |
; |      |  |      |  |   |           |
; |    .-------.   |.-------.         |
; |     \  *  /    | \  -  /          |
; |      \___/     |  \___/           |
; |        |       |    |             |
; +--------+      /'\   +-------------+
;                / 1 \
;               /_____\

; controller diagram

(controller (assign produce (const 1))

            exp-loop
            (test (op =) (reg n) (const 0))
            (branch (label exp-done))
            (assign p (op *) (reg p) (reg b))
            (assign n (op -) (reg n) (const 1))
            (goto (labal exp-loop))

            exp-done)