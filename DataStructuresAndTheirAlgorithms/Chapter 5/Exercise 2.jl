#=

Q.

Let n be a fixed positive integer. Find all quadruples <i_1, i_2, m_1, m_2) of integers such that,
for all strings w of length n, it is true that w = Concat(Substring(w, i_1, m_1), Substring(w, i_2, m_2))

A.

i_1 = 0
m_1 + 1 = i_2
i_2 + m_2 = |w|

=#

w = "And, I, am, Ironman."
w2 = string(SubString(w, 1, 4), SubString(w, 5, length(w)))
print(w2)

# In julia, index starts from 1 and SubString takes the third parameter to indicate the end point.
print("Length of string: ", length(w), " Length of 2nd substring: ", length(w)-5) # 20, 15

# So, m_1 + 1 = i_2, and i_2 + m_2 = |w|.

