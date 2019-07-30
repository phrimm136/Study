#lang sicp
; The english sentense starts at left and ends at right.
; If we choose the order of parse rather than left to right, the sequence of sentence will go wrong.
; ex) Parsing "an assassin kills a boss" with right to left order -> ((a boss) (kills (an assassin)))