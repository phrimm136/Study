#=

Q.

Write the memory allocation algorithm that goes with Algorithm 10.5.
Assume that every request is for a cell of k pointer fields.

A.

It's too abstract..

function Allocate:
{Allocate cell from to-space and return its pointer}
{Cur is an arbitrary location of to-space and tail is end of.}
    if cur < tail
        p <- cur
        cur <- k
        return p
    else
        return null

=#
