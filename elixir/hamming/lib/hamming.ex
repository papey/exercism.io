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

  def hamming_distance(strand1, strand2), do: do_hamming_distance(strand1, strand2, 0)

  def do_hamming_distance([], [], diff), do: {:ok, diff}

  def do_hamming_distance([a | rest1], [a | rest2], diff),
    do: do_hamming_distance(rest1, rest2, diff)

  def do_hamming_distance([_ | rest1], [_ | rest2], diff),
    do: do_hamming_distance(rest1, rest2, diff + 1)
end
