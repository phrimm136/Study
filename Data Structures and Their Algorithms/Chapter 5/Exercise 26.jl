#=

Q.

Solve Problem 25 without the assumption of a universal alphabet. That is, the decoding algorithm must be assumed to know nothing at all about the size of Σ.

A.

Encode the length of each character into "fixed" binary string in front of it.

=#


function huffman_write(tree)
    str = ""
    if tree["left"] == nothing && tree["right"] == nothing
        str = string(str,
                     string("0",
                            string("00000000"[1:8-length(bitstring(Int8(length(tree["data"]))))],
                                   bitstring(Int8(length(tree["data"])))),
                            tree["data"]))
    else
        str = string(str, string("1", string(huffman_write(tree["left"]),
                                             huffman_write(tree["right"]))))
    end
    return str
end


function huffman_read(str)
    function recur()
        tree = Dict{String, Any}("data" => nothing, "left" => nothing, "right" => nothing)
        if code[1] == '1'
            code = SubString(code, 2, length(code))
            tree["left"] = recur()
            tree["right"] = recur()
        else
            code = SubString(code, 2, length(code))
            len = parse(Int, code[1:8], base=2)
            tree["data"] = code[9:8+len]
            code = SubString(code, 9+len, length(code))
        end
        return tree
    end
    code = str
    return recur()
end


tree = Dict("data" => nothing,
            "left" => Dict("data" => nothing,
                           "left" => Dict("data" => string("0", bitstring(Int8('a'))),
                                          "left" => nothing,
                                          "right" => nothing),
                           "right" => Dict("data" => string("0", bitstring(Int8('b'))),
                                           "left" => nothing,
                                           "right" => nothing)),
            "right" => Dict("data" => nothing,
                            "left" => Dict("data" => string("0", bitstring(Int8('c'))),
                                           "left" => nothing,
                                           "right" => nothing),
                            "right" => Dict("data" => string("0", bitstring(Int8('d'))),
                                            "left" => nothing,
                                            "right" => nothing)))


binary = huffman_write(tree)
tree_decode = huffman_read(binary)
tree == tree_decode # true
