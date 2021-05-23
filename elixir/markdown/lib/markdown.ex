defmodule Markdown do
  @tags [%{reg: ~r/__([^_]+)__/, tag: "strong"}, %{reg: ~r/_([^_]+)_/, tag: "em"}]

  @doc """
    Parses a given string with Markdown syntax and returns the associated HTML for that string.

    ## Examples

    iex> Markdown.parse("This is a paragraph")
    "<p>This is a paragraph</p>"

    iex> Markdown.parse("#Header!\n* __Bold Item__\n* _Italic Item_")
    "<h1>Header!</h1><ul><li><em>Bold Item</em></li><li><i>Italic Item</i></li></ul>"
  """
  @spec parse(String.t()) :: String.t()
  def parse(m) do
    String.split(m, "\n")
    |> Enum.map_join(&process/1)
    |> process_tags()
    |> wrap_lists()
  end

  defp process("#" <> t), do: process_header(t, 1)
  defp process("* " <> t), do: "<li>#{t}</li>"
  defp process(t), do: "<p>#{t}</p>"

  defp process_header(" " <> t, level), do: "<h#{level}>#{t}</h#{level}>"
  defp process_header("#" <> t, level), do: process_header(t, level + 1)

  defp process_tags(raw) do
    Enum.reduce(@tags, raw, fn rep, acc ->
      String.replace(acc, rep.reg, "<#{rep.tag}>\\1</#{rep.tag}>")
    end)
  end

  defp wrap_lists(l) do
    String.replace(l, "<li>", "<ul><li>", global: false)
    |> String.replace_suffix("</li>", "</li></ul>")
  end
end
