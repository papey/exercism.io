return {
  decode = function(s)
    return s:gsub("(%d+)(.)", function (l, c)
        return c:rep(l)
      end)
  end,

  encode = function(s)
    for char in s:gmatch("(.)") do
      s = s:gsub(char:rep(2) .. "+", function (times)
        return #times .. char
      end)
    end

    return s
  end
}
