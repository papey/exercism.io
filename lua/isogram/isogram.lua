return function(s)
    local found = {}

    for char in s:lower():gmatch("%a") do
        if found[char] then
            return false
        end
        found[char] = true
    end

    return true

end
