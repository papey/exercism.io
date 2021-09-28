require Bitwise

defmodule Secrets do
  def secret_add(secret), do: &(&1 + secret)

  def secret_subtract(secret), do: &(&1 - secret)

  def secret_multiply(secret), do: &(&1 * secret)

  def secret_divide(secret) when secret != 0, do: &((&1 / secret) |> trunc())

  def secret_and(secret), do: &Bitwise.band(&1, secret)

  def secret_xor(secret), do: &Bitwise.bxor(&1, secret)

  def secret_combine(secret_function1, secret_function2) do
    fn param ->
      param
      |> secret_function1.()
      |> secret_function2.()
    end
  end
end
