defmodule Bob do
  def hey(input) do
    sanitized = String.trim(input)
    shouting = shouting?(sanitized)
    question = question?(sanitized)
    alpha = alpha?(sanitized)

    cond do
      silence?(sanitized) -> "Fine. Be that way!"
      alpha and shouting and question -> "Calm down, I know what I'm doing!"
      alpha and shouting -> "Whoa, chill out!"
      question -> "Sure."
      true -> "Whatever."
    end
  end

  defp alpha?(input), do: Regex.match?(~r/\p{L}+/, input)

  defp silence?(input), do: input == ""

  defp shouting?(input), do: String.upcase(input) == input

  defp question?(input), do: String.last(input) == "?"
end
