return function (array, target)
  local function f(left, right)
    local len = right - left + 1
    local middle = left + math.floor(len / 2)

    if len <= 1 then return array[left] == target and left or -1 end

    local try = array[middle]

    if try < target then return f(middle + 1, right)
    elseif try > target then return f(left, middle - 1)
    else return middle end
  end

  return f(1, #array)
end
