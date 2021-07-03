defmodule Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance('AAGTCATA', 'TAGCGATC')
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: {:ok, non_neg_integer} | {:error, String.t()}
  def hamming_distance(strand1, strand2) when length(strand1) != length(strand2),
    do: {:error, "Lists must be the same length"}

  def hamming_distance(strand1, strand2), do: do_hamming_distance(Enum.zip(strand1, strand2), 0)

  defp do_hamming_distance([], diff), do: {:ok, diff}

  defp do_hamming_distance([{a, a} | rest], diff),
    do: do_hamming_distance(rest, diff)

  defp do_hamming_distance([_ | rest], diff),
    do: do_hamming_distance(rest, diff + 1)
end
