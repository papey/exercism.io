return function (s)
    local matrix = {}
    local i = 1

    for l in s:gmatch("[^\r\n]+") do
        matrix[i] = {}

        for n in l:gmatch("%d+") do
            table.insert(matrix[i], tonumber(n))
        end
        i = i + 1
    end

    function matrix.row(n)
        return matrix[n]
    end

    function matrix.column(n)
        local col = {}
        for index = 1, #matrix do col[index] = matrix[index][n] end
        return col
    end

    return matrix

end
