#lang sicp
(rule (bigshot ?person)
      (and (job ?person (?division . ?type))
           (or (not (supervisor ?person ?boss))
               (and (supervisor ?person ?boss)
                    (not (job ?boss (?division . ?x)))))))