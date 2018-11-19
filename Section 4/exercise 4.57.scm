#lang sicp
; (rule (same-job ?person1 ?person2)
;       (and (job ?person1 ?job1)
;            (job ?person2 ?job2)
;            (or (same ?job1 ?job2)
;                (can-do-job ?job1 ?job2)
;                (can-do-job ?job2 ?job1))
;            (not (same ?person1 ?person2))))


; (same-job (Fect Cy D) ?person)


; (and (same-job ?replacable ?person)
;      (salary ?replacable ?salary1)
;      (salary ?person ?salary2)
;      (lisp-value < ?salary1 ?salary2))