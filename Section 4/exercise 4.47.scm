#lang sicp
; (parse '(the student with the cat sleeps in the class))

; Without change

; (sentence (noun-phrase (simple-noun-phrase (article the)
;                                            (noun student))
;                        (prep-phrase (prep with)
;                                     (simple-noun-phrase (article the)
;                                                         (noun cat))))
;           (verb-phrase (verb sleeps)
;                        (prep-phrase (prep in)
;                                     (simple-noun-phrase (article the)
;                                                         (noun class)))))

; With change

; Infinite loop from (parse-verb-phrase) in the list.
; If amb aborts at (parse-word verbs), it could work well.


; If we interchange the order of amb in parse-verb-phrase, the infinite loop always occur.