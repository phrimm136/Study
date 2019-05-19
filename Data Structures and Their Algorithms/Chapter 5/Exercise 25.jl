#=

Q.

When using the Huffman algorithm, the compressed text must begin with a description of the encoding tree.
Suppose that the alphabet Σ is fixed and consists of 256 characters, each encoded as a distinct sequence of eight bits (this is usually the case, as when ASCII or EBCDIC is the understood alphabet).
Devise a scheme for describing the encoding tree in the encoded text, and write the programs used by the encoder to describe the tree and by the decoder to recover the tree. Of course, your representation should be as space-efficient as possible.

A.

If the node is leaf write 0 and bits of characters, else write 1.

=#


function huffman_write(tree)
    str = ""
    if tree["left"] == nothing && tree["right"] == nothing
        str = string(str, string("0", tree["data"]))
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
            tree["data"] = code[1:8]
            code = SubString(code, 9, length(code))
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
