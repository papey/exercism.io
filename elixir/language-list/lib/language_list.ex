defmodule LanguageList do
  def new(), do: []

  def add(list, language), do: [language | list]

  def remove([_ | rest]), do: rest

  def first([head | _]), do: head

  def count(list), do: length(list)

  def exciting_list?(list), do: "Elixir" in list
end
