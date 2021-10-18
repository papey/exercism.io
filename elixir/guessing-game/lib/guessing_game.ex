defmodule GuessingGame do
  defguard so_close?(a, b)
           when abs(a - b) == 1

  def compare(secret_number, guess \\ :no_guess)
  def compare(_, :no_guess), do: "Make a guess"

  def compare(secret_number, secret_number), do: "Correct"

  def compare(secret_number, guess) when so_close?(secret_number, guess),
    do: "So close"

  def compare(secret_number, guess) when guess < secret_number, do: "Too low"
  def compare(_, _), do: "Too high"
end
