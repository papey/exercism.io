defmodule BirdCount do
  def today([]), do: nil

  def today([count | _]), do: count

  def increment_day_count([]), do: [1]
  def increment_day_count([count | rest]), do: [count + 1 | rest]

  def has_day_without_birds?([]), do: false
  def has_day_without_birds?([0 | _]), do: true
  def has_day_without_birds?([_ | rest]), do: has_day_without_birds?(rest)

  def total([]), do: 0
  def total([acc]), do: acc
  def total([acc, next | rest]), do: total([acc + next | rest])

  def busy_days([]), do: 0

  def busy_days(list), do: busy_days(list, 0)

  def busy_days([], acc), do: acc
  def busy_days([day | rest], acc) when day >= 5, do: busy_days(rest, acc + 1)
  def busy_days([_ | rest], acc), do: busy_days(rest, acc)
end
