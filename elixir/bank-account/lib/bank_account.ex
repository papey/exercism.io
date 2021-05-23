defmodule BankAccount do
  @moduledoc """
  A bank account that supports access from multiple processes.
  """

  use Agent

  @typedoc """
  An account handle.
  """
  @opaque account :: pid

  @doc """
  Open the bank. Makes the account available.
  """
  @spec open_bank() :: account
  def open_bank() do
    {:ok, pid} = Agent.start(fn -> 0 end)
    pid
  end

  @doc """
  Close the bank. Makes the account unavailable.
  """
  @spec close_bank(account) :: atom
  def close_bank(account), do: Agent.stop(account, :normal)

  @doc """
  Get the account's balance.
  """
  @spec balance(account) :: integer
  # first approach using with
  def balance(account) do
    with true <- Process.alive?(account) do
      Agent.get(account, & &1)
    else
      _ -> {:error, :account_closed}
    end
  end

  @doc """
  Update the account's balance by adding the given amount which may be negative.
  """
  @spec update(account, integer) :: any
  # second approach using a wrapper
  def update(account, ammount) do
    action(account, fn account -> Agent.update(account, &(&1 + ammount)) end)
  end

  defp action(account, fun) do
    if Process.alive?(account) do
      fun.(account)
    else
      {:error, :account_closed}
    end
  end
end
