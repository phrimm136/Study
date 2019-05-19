#=

Q.

Show the operation of the Lempel-Ziv compression algorithm on the following tercet (from a poem by J. Holobom, as quoted by A. Bierce).
Assume that lines are separated by a single space.

    abracadabra, abracadab,
    abracada, abracad,
    abraca, abrac, abra, ab!

A.

Set   Output    Add to Dictionary
1     #(a)      -
2     #(b)      ab
3     #(r)      br
4     #(a)      ra
5     #(c)      ac
6     #(a)      ca
7     #(d)      ad
8     #(ab)     da
9     #(ra)     abr
10    #(,)      ra,
11    #( )      ,□
12    #(abr)     a
13    #(ac)     abra
14    #(ad)     aca
15    #(ab)     ada
16    #(, )     ab,
17    #(abra)   , a
18    #(ca)     abrac
19    #(da)     cad
20    #(, a)    da,
21    #(br)     , ab
22    #(aca)    bra
23    #(d)      acad
24    #(, ab)   d,
25    #(ra)     , abr
26    #(ca)     rac
27    #(, abr)  ca,
28    #(ac)     , abra
29    #(, abra) ac,
30    #(, ab)   (, abra,)
31    #(!)      (, ab!)

=#
