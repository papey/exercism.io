defmodule BirdCount do
  def today([]), do: nil

  def today([count | _]), do: count

  def increment_day_count([]), do: [1]
  def increment_day_count([count | rest]), do: [count + 1 | rest]

  def has_day_without_birds?([]), do: false
  def has_day_without_birds?([0 | _]), do: true
  def has_day_without_birds?([_ | rest]), do: has_day_without_birds?(rest)

  def total(list), do: do_total(list, 0)
  defp do_total([], acc), do: acc
  defp do_total([current | rest], acc), do: do_total(rest, acc + current)

  def busy_days(list), do: do_busy_days(list, 0)

  defp do_busy_days([], acc), do: acc
  defp do_busy_days([day | rest], acc) when day >= 5, do: do_busy_days(rest, acc + 1)
  defp do_busy_days([_ | rest], acc), do: do_busy_days(rest, acc)
end
