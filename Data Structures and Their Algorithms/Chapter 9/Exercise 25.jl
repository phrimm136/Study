#=

Q.

Insert the cities of Figure 9.12 into a 2-d tree by starting with a split
on latitude, rather than longitude as in Figure 9.13. Illustrate the
corresponding spatial partition.


A.

                                                              Beloit, IL
                                                           ('42.31', 89.04)
                                                          /                \
                           Dubuque, IA                                                         Freeport, IL
                         (42.31, '90.41')                                                    (42.17, '89.38')
                       /                \                                                   /                \
                  La Crosse, WI    Fond du Lac, WI                       Rock Island, IL                          Elgin, IL
                 ('43.48', 91.04)  ('43.04', 88.27)                     ('41.30', 90.34)                       ('42.03', 88.19)
                /                 /                \                   /                \                     /                \
           Winona, MN       Madison, WI       Appleton, WI      Iowa City, IA      Clinton, IA          Rockfold, IL       Joliet, IL
        (44.02, '91.37') (43.04, '89.22')    (44.17, '88.24')  (41.39, '91.31')  (41.51, '90.12')     (42.16, '89.06')   (41.32, '88.05')

=#
