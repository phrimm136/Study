#=

Q.

If w is any string, define PrefSuf(w) to be the largest j < |w| such that Substring(w, 0, j) = Substring(w, |w|-j, j); that is, PrefSuf(w) is the length of the longest prefix of w (other than w itself) that is also a suffix of w. For example, PrefSuf(ABCAB) = 2, PrefSuf(AAAAA) = 4, and PrefSuf(ABC) = 0.
Given any string p, the function AllPrefSufs described in Algorithm 5.8 computes an array ps such that ps[i] = PrefSuf(Substring(p, 0, i)) for each 0 < i < Ip1; that is, ps contains the value of PrefSuf(p') for each prefix p' of p.

a. Prove that Algorithm 5.8 works as advertised.

b. Prove that Algorithm 5.8 works in linear time; that is, in time O(|P|).

=#


function all_pref_sufs(p)
    # The result ps is an array of integers with the same indices as p
    function extend(i, j)
        # Chain through ps looking for an extendible value
        if p[j] == p[i+1]
            return i+1
        end
        if i == 0
            return 0
        end
        return extend(ps[i], j)
    end
    
    ps = fill(0, length(p))
    
    for j = 2:length(p)
        ps[j] = extend(ps[j-1], j)
    end
    return ps
end

#=

A.

Julia begins index from 1 and it confuses me.

a.

If the pre-post string of previous substring and the next character is the pre-post string of current substring, return its length(previous length plus one). The characters of pre-post string is validated when it is derived.
If not, take the pre-post string of previous pre-post string and do the validation check until the length of the pre-post string becomes zero and then check if the first character is equal to the last one. Because the pre-post string only exists in the longer pre-post string, so we don't need to take it from all previous elements.

b.

The algorithm iterates |p| times. During iteration, number of extend function evaluation is proportional to number of recursive pre-post string of substring, which is independent to |p|.
So the algorithm works in time O(|p|)

=#
