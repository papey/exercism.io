local function isPrime(n)
    for d = 2, math.sqrt(n) do
        if (n % d) == 0 then
            return false
        end
    end

    return true
end

local function nth(n)
    if n < 1 then return error("Invalid input") end

    local prime = 1
    local found = 0

    while found < n do
        prime = prime + 1
        if isPrime(prime) then
            found = found + 1
        end
    end

    return prime
end

return nth
