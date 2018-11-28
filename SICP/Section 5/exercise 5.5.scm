#lang sicp
; factorial 5

; n val continue   stack

; 5     fact-done       <- initial.
; 4     after-fact 5
;                  fact-done
; 3     after-fact 4 5
;                  after-fact fact-done
; 2     after-fact 3 4 5
;                  after-fact after-fact fact-done
; 1 1   after-fact 2 3 4 5
;                  after-fact after-fact after-fact fact-done
; 2 2   after-fact 3 4 5
;                  after-fact after-fact fact-done
; 3 6   after-fact 4 5
;                  after-fact fact-done
; 4 24  after-fact 5
;                  fact-done
; 5 120 fact-done

; -> 120


; fibonacci 5

; n    val  continue     stack

; 5         fib-done          <- initial.
; 5->4      afterfib-n-1 5
;                        fib-done
;
; 4->3      afterfib-n-1 4 5
;                        afterfib-n-1 fib-done
;
; 3->2      afterfib-n-1 3 4 5
;                        afterfib-n-1 afterfib-n-1 fib-done
;
; 2->1 1    afterfib-n-1 2 3 4 5
;                        afterfib-n-1 afterfib-n-1 afterfib-n-1 fib-done
;
; 1->2 1    afterfib-n-2 3 4 5
;  ->0                   afterfib-n-1 afterfib-n-1 afterfib-n-1 fib-done
;                        1
; 0    0    afterfib-n-2 3 4 5
;                        afterfib-n-1 afterfib-n-1 afterfib-n-1 fib-done
;                        1
; 0    1    afterfib-n-1 3 4 5
;                        afterfib-n-1 afterfib-n-1 fib-done
;
; 3->1 1    afterfib-n-2 4 5
;                        afterfib-n-1 afterfib-n-1 fib-done
;                        1
; 1    1->2 afterfib-n-1 4 5
;                        afterfib-n-1 fib-done
;
; 4->2      afterfib-n-2 5
;                        afterfib-n-1 fib-done
;                        2
; 2->1      afterfib-n-1 2 5
;                        afterfib-n-2 afterfib-n-1 fib-done
;                        2
; 1->2 1    afterfib-n-2 5
;  ->0                   afterfib-n-2 afterfib-n-1 fib-done
;
;                        1 2
; 1    1    afterfib-n-2 5
;                        afterfib-n-1 fib-done
;                        2
; 1    2->3 afterfib-n-1 5
;                        fib-done
; 5->3 3    afterfib-n-2
;                        fib-done
;

; after computing fib 3

; 2    2    afterfib-n-2
;                        fib-done
;                        3
; 2    3->5 fib-done

; -> 5