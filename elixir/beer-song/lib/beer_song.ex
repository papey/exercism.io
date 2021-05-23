defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t()
  def verse(number) do
    "#{String.capitalize(bottles(number))} of beer on the wall, #{bottles(number)} of beer.
#{todo(number)}, #{bottles(number - 1)} of beer on the wall.\n"
  end

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics() :: String.t()
  def lyrics(), do: lyrics(99..0)

  @spec lyrics(Range.t()) :: String.t()
  def lyrics(range) do
    Enum.map(range, &verse/1)
    |> Enum.join("\n")
  end

  defp bottles(0), do: "no more bottles"
  defp bottles(1), do: "1 bottle"
  defp bottles(n) when n < 0, do: bottles(99)
  defp bottles(n), do: "#{n} bottles"

  defp todo(0), do: "Go to the store and buy some more"
  defp todo(1), do: take("it")
  defp todo(_), do: take("one")

  defp take(value), do: "Take #{value} down and pass it around"
end
