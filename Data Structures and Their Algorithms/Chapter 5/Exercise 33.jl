#=

Q.

Write the procedure LZEncode, the inverse of procedure LZDecode (Algorithm 5.3 on page 153).
LZEncode takes two arguments: a string to be encoded and a bitstream to receive the encoding. You may use a subroutine WriteOneCodeNumber(c, b) that outputs an integer c to a bitstream b. LZEncode also uses the same abstract dictionary operations as the decoder.
(For purposes of this exercise, don't worry about generating a large number of calls on LookUp nor about dictionary overflow. But see page 484.)

A.

=#

function lookup(c, D)
    for i in D
        if c == i
            return D[i]
        end
    end
    return 0
end


function read_one_code_number(b)
    c = parse(Int, b[1:8], base=2)
    b = b[9:end]

    return c, b
end


function write_one_code_number(c, b)
    b = string(b, bitstring(Int8(c)))
end


function LZDecode(b)
    # Recover the string encoded in b
    # D is a dictionary associated code numbers with strings.
    D = Dict()
    nextcode = 0 # The next code number to be assigned
    S = "" # Output string
    # Insert each single-character string into the dictionary
    for i in "!?,. qwertyuiopasdfghjklzxcvbnm"
        D[nextcode] = i
        nextcode += 1
    end
    # Special first step with no dictionary updates
    c, b = read_one_code_number(b)
    current = D[c]
    S = string(S, current) # output(current)
    # Main loop
    while length(b) != 0
        previous = current
        c, b = read_one_code_number(b)
        current = D[c]
        D[nextcode] = string(previous, current[1])
        nextcode += 1
        S = string(S, current) # output(current)
    end
    return S
end


function LZEncode(S, b)
    # Encode the string in b
    # D is a dictionary associated code numbers with strings.
    D = Dict()
    nextcode = 0 # The next code number to be assinged
    # Insert each single-character string into the dictionary
    for i in "!?,. qwertyuiopasdfghjklzxcvbnm"
        D[i] = nextcode
        nextcode += 1
    end
    previous = ""
    current = S[1]
    S = S[2:end]
    # Main loop
    while length(S) != 0
        if lookup(string(current, S[1]), D) != 0
            current = string(current, S[1])
        else
            b = write_one_code_number(D[current], b)
            if previous == "" # Special first step with no dictionary updates
                D[string(previous, current[1])] = nextcode
                nextcode += 1
            end
            previous = current
            current = S[1]
        end
        S = S[2:end]
    end
    return b
end


S = "cocoa and bananas"
e = ""
e = LZEncode(S, e)
S_d = LZDecode(e)

