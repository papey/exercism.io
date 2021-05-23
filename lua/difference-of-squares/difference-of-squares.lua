local diff = {}

function diff.square_of_sum(n)
  local sum = 0

  for i = 1, n, 1 do
    sum = sum + i
  end

  return sum * sum
end

function diff.sum_of_squares(n)
  local sum = 0

  for i = 1, n, 1 do
    sum = sum + (i * i)
  end

  return sum

end

function diff.difference_of_squares(n)
  return diff.square_of_sum(n) - diff.sum_of_squares(n)
end

return diff
