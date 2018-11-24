#lang sicp
(lambda <vars>
  (define u <e1>)
  (define v <e2>)
  <e3>)

; global-environment---|
;       |             -----<vars>,u,v
;       |             ^
;     lambda ----------
;       |
;      <e3>

; becomes

(lambda <vars>
  (let ((u '*unassigned*)
        (v '*unassigned*))
    (set! u <e1>)
    (set! v <e2>)
    <e3>))

; global-environment---
;       |             |---<vars>
;       |                   |
;     lambda                |
;       |                  u,v
;     lambda                |
;       |-------------------|
;     <e3>


; let is syntatic sugar of lambda, so there are two lambda and a frame is extended.


; Despite of this difference, an environment that a body of procedure is looking is same in both environment.


; Need to merge let and parent definition/lambda.