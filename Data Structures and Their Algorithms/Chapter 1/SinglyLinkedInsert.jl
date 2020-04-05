mutable struct LList{Int}
    key::Int
    next::Union{LList, Nothing}
end

function SinglyLinkedInsert(P::LList, Q::LList)
    """
    Insert the cell which P points just after the cell to which Q points
    """
    P.next = Q.next
    Q.next = P
end
