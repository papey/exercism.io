defmodule Gigasecond do
  @gigasecond 1_000_000_000

  @doc """
  Calculate a date one billion seconds after an input date.
  """
  @spec from({{pos_integer, pos_integer, pos_integer}, {pos_integer, pos_integer, pos_integer}}) ::
          :calendar.datetime()

  def from(date) do
    NaiveDateTime.from_erl!(date)
    |> NaiveDateTime.add(@gigasecond)
    |> NaiveDateTime.to_erl()
  end
end
