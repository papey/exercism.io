defmodule Forth do
  @opaque evaluator :: %Forth{}

  import Kernel, except: [apply: 2]

  defmodule StackUnderflow do
    defexception []
    def message(_), do: "stack underflow"
  end

  defmodule InvalidWord do
    defexception word: nil
    def message(e), do: "invalid word: #{inspect(e.word)}"
  end

  defmodule UnknownWord do
    defexception word: nil
    def message(e), do: "unknown word: #{inspect(e.word)}"
  end

  defmodule DivisionByZero do
    defexception []
    def message(_), do: "division by zero"
  end

  @type t :: %Forth{stack: List.t()}
  defstruct stack: [], definitions: %{}

  defmodule WordDefinition do
    defstruct word: "", instructions: []
  end

  @ops %{"+" => :add, "-" => :sub, "/" => :div, "*" => :mul}
  @functions %{add: &Kernel.+/2, sub: &Kernel.-/2, div: &Kernel.div/2, mul: &Kernel.*/2}

  @inst %{"dup" => :dup, "drop" => :drp, "swap" => :swp, "over" => :ovr}

  @doc """
  Create a new evaluator.
  """
  @spec new() :: evaluator
  def new() do
    %Forth{}
  end

  @doc """
  Evaluate an input string, updating the evaluator state.
  """
  @spec eval(evaluator, String.t()) :: evaluator
  def eval(ev, s) do
    String.downcase(s)
    |> String.split(~r/[\pC\pZ]+/u)
    |> parse_tokens(ev.definitions)
    |> eval_tokens(ev)
  end

  # init
  defp parse_tokens(tokens, def), do: parse_tokens(tokens, def, :none, [])

  # end
  defp parse_tokens([], _, _, instructions), do: Enum.reverse(instructions)

  # word definition start
  defp parse_tokens([":" | rest_tokens], def, :none, instructions),
    do: parse_tokens(rest_tokens, def, :word_definition, instructions)

  # word definition end
  defp parse_tokens([";" | rest_tokens], def, wd, instructions),
    do:
      parse_tokens(rest_tokens, def, :none, [
        {:wd, %{wd | instructions: Enum.reverse(wd.instructions)}} | instructions
      ])

  # word definition
  defp parse_tokens([word | rest_tokens], def, :word_definition, instructions) do
    if String.match?(word, ~r/\d+/), do: raise(InvalidWord)
    parse_tokens(rest_tokens, def, %WordDefinition{word: word}, instructions)
  end

  # word definition, instructions accumulation
  defp parse_tokens(
         [word | rest_tokens],
         def,
         wd = %WordDefinition{instructions: word_instructions},
         instructions
       ),
       do:
         parse_tokens(
           rest_tokens,
           def,
           %{wd | instructions: [word | word_instructions]},
           instructions
         )

  # tokens and instructions
  defp parse_tokens([token | rest_tokens], def, _, instructions) do
    parse_tokens(rest_tokens, def, :none, [parse_token(token, def) | instructions])
  end

  defp parse_token(token, def) do
    cond do
      String.match?(token, ~r/\d+/) ->
        {:number, String.to_integer(token)}

      # word redefining get priority over default definition
      token in Map.keys(def) ->
        {:definition, token}

      token in Map.keys(@ops) ->
        {:fun, @ops[token]}

      token in Map.keys(@inst) ->
        {:inst, @inst[token]}

      # word may be defined earlier, token is maybe just a call to a definition
      true ->
        {:definition, token}
    end
  end

  defp eval_tokens([], ev), do: ev

  defp eval_tokens([{:number, value} | rest], ev) do
    eval_tokens(rest, %{ev | stack: [value | ev.stack]})
  end

  defp eval_tokens([{:definition, word} | rest], ev) when is_map_key(ev.definitions, word) do
    instructions =
      Map.get(ev.definitions, word)
      |> Enum.map(&parse_token(&1, ev.definitions))

    eval_tokens(rest, eval_tokens(instructions, ev))
  end

  defp eval_tokens([{:definition, _} | _], _), do: raise(UnknownWord)

  defp eval_tokens([{:inst, :ovr} | rest], ev = %{stack: [a, b | stack]}),
    do: eval_tokens(rest, %{ev | stack: [b, a, b | stack]})

  defp eval_tokens([{:inst, :ovr} | _], _),
    do: raise(StackUnderflow)

  defp eval_tokens([{:inst, :swp} | rest], ev = %{stack: [a, b | stack]}),
    do: eval_tokens(rest, %{ev | stack: [b, a | stack]})

  defp eval_tokens([{:inst, :swp} | _], _),
    do: raise(StackUnderflow)

  defp eval_tokens([{:inst, :drp} | _], %{stack: []}),
    do: raise(StackUnderflow)

  defp eval_tokens([{:inst, :drp} | rest], ev = %{stack: [_ | ts]}),
    do: eval_tokens(rest, %{ev | stack: ts})

  defp eval_tokens([{:inst, :dup} | _], %{stack: []}),
    do: raise(StackUnderflow)

  defp eval_tokens([{:inst, :dup} | rest], ev = %{stack: [hs | _] = stack}),
    do: eval_tokens(rest, %{ev | stack: [hs | stack]})

  defp eval_tokens([{:fun, op} | rest], ev),
    do: eval_tokens(rest, %{ev | stack: apply(op, ev.stack)})

  defp eval_tokens([{:wd, wd} | rest], ev),
    do: eval_tokens(rest, %{ev | definitions: Map.put(ev.definitions, wd.word, wd.instructions)})

  defp eval_tokens(_, _), do: raise(UnknownWord)

  defp apply(:div, [0, _ | _]), do: raise(DivisionByZero)
  defp apply(op, [a, b | t]), do: [@functions[op].(b, a) | t]
  defp apply(_, _), do: raise(StackUnderflow)

  @doc """
  Return the current stack as a string with the element on top of the stack
  being the rightmost element in the string.
  """
  @spec format_stack(evaluator) :: String.t()
  def format_stack(%Forth{stack: stack}), do: Enum.reverse(stack) |> Enum.join(" ")
end
