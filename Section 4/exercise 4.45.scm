#lang sicp
; (sentence (simple-noun-phrase (article the)
;                               (noun professor))
;           (verb-phrase (verb-phrase (verb-phrase (verb lectures)
;                                                  (prep-phrase (prep to)
;                                                               (simple-noun-phrase (article the)
;                                                                                   (noun student))))
;                                     (prep-phrase (prep in)
;                                                  (simple-noun-phrase (article the)
;                                                                      (noun class))))
;                        (prep-phrase (prep with) (simple-noun-phrase (article the)
;                                                                     (noun cat)))))

; -> With his cat, the professor who is in the class lectures to the students.


; (sentence (simple-noun-phrase (article the)
;                               (noun professor))
;           (verb-phrase (verb-phrase (verb lectures)
;                                     (prep-phrase (prep to)
;                                                  (simple-noun-phrase (article the)
;                                                                      (noun student))))
;                        (prep-phrase (prep in)
;                                     (noun-phrase
;                                      (simple-noun-phrase (article the)
;                                                          (noun class))
;                                      (prep-phrase (prep with)
;                                                   (simple-noun-phrase (article the)
;                                                                       (noun cat)))))))

; -> The professor who is in the class where the cat is lecutres to the students.


; (sentence (simple-noun-phrase (article the)
;                               (noun professor))
;           (verb-phrase (verb-phrase (verb lectures)
;                                     (prep-phrase (prep to)
;                                                  (noun-phrase (simple-noun-phrase (article the)
;                                                                                   (noun student))
;                                                               (prep-phrase (prep in)
;                                                                            (simple-noun-phrase (article the)
;                                                                                                (noun class))))))
;                        (prep-phrase (prep with)
;                                     (simple-noun-phrase (article the)
;                                                         (noun cat)))))

; -> With his cat, the professor lectures to the students who are in the class.


; (sentence (simple-noun-phrase (article the)
;                               (noun professor))
;           (verb-phrase (verb lectures)
;                        (prep-phrase (prep to)
;                                     (noun-phrase (noun-phrase (simple-noun-phrase (article the)
;                                                                                   (noun student))
;                                                               (prep-phrase (prep in)
;                                                                            (simple-noun-phrase (article the)
;                                                                                                (noun class))))
;                                                  (prep-phrase (prep with)
;                                                               (simple-noun-phrase (article the) (noun cat)))))))

; -> The professor lectures to the students who are in the class and to the cat.


; (sentence (simple-noun-phrase (article the)
;                               (noun professor))
;           (verb-phrase (verb lectures)
;                        (prep-phrase (prep to)
;                                     (noun-phrase (simple-noun-phrase (article the)
;                                                                      (noun student))
;                                                  (prep-phrase (prep in)
;                                                               (noun-phrase (simple-noun-phrase (article the)
;                                                                                                (noun class))
;                                                                            (prep-phrase (prep with)
;                                                                                         (simple-noun-phrase (article the)
;                                                                                                             (noun cat)))))))))

; -> The professor lectures to the students who are in the class where the cat is.