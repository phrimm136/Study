#=

Q.

The captions of Figures 5.12 and 5.15 each contain the sentence "Blank boxes in the target represent characters as yet unexamined." Explain carefully why this statement is true for only one of these figures, and not always (but sometimes) true for the other.

A.

At i, BM algorithm reveals the characters on the left when pattern matches, which makes some blank characters in new i are already examined. Unless there are no pattern matched or the only first one is matched, the sentence is not true for the second figure.
Howerver, the pattern match on KMP algorithm just reduces the characters on the left, so there are no impact by pattern match.

=#
