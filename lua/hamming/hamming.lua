local Hamming = {}

function Hamming.compute(a,b)
    local d = 0

    if a:len() ~= b:len() then
        return -1
    end

    for i = 1, a:len() do
        if a:sub(i, i) ~= b:sub(i, i) then
            d = d + 1
        end
    end

    return d
end

return Hamming
