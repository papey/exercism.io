return function(which)

    local start = ("A"):byte()
    local steps = which:byte() - start
    local lines = {}

    for i = 0, steps, 1 do
        local half = (" "):rep(i) .. string.char(start + i) .. (" "):rep(steps - i)
        local line = half:sub(2):reverse() .. half .. "\n"
        lines[i + 1] = line
        lines[2*steps - i + 1] = line
    end

    return table.concat(lines)

end
