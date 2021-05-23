defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number), do: number |> convert() |> to_string()

  defp convert(0), do: []
  defp convert(n) when n >= 1000, do: [?M | convert(n - 1000)]
  defp convert(n) when n >= 900, do: [?C, ?M | convert(n - 900)]
  defp convert(n) when n >= 500, do: [?D | convert(n - 500)]
  defp convert(n) when n >= 400, do: [?C, ?D | convert(n - 400)]
  defp convert(n) when n >= 100, do: [?C | convert(n - 100)]
  defp convert(n) when n >= 90, do: [?X, ?C | convert(n - 90)]
  defp convert(n) when n >= 50, do: [?L | convert(n - 50)]
  defp convert(n) when n >= 40, do: [?X, ?L | convert(n - 40)]
  defp convert(n) when n >= 10, do: [?X | convert(n - 10)]
  defp convert(n) when n == 9, do: [?I, ?X]
  defp convert(n) when n >= 5, do: [?V | convert(n - 5)]
  defp convert(n) when n == 4, do: [?I, ?V]
  defp convert(n) when n >= 1, do: [?I | convert(n - 1)]
end
