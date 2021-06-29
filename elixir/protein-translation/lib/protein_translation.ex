defmodule ProteinTranslation do
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {atom, list(String.t())}
  def of_rna(rna), do: of_rna(rna, [])

  defp of_rna("", proteins), do: {:ok, proteins}

  defp of_rna(<<codon::bytes-size(3)>> <> rna, proteins) do
    case of_codon(codon) do
      {:ok, "STOP"} -> {:ok, proteins}
      {:ok, protein} -> of_rna(rna, proteins ++ [protein])
      {:error, _reason} -> {:error, "invalid RNA"}
    end
  end

  @proteins %{
    "UGU" => "Cysteine",
    "UGC" => "Cysteine",
    "UUA" => "Leucine",
    "UUG" => "Leucine",
    "AUG" => "Methionine",
    "UUU" => "Phenylalanine",
    "UUC" => "Phenylalanine",
    "UCU" => "Serine",
    "UCC" => "Serine",
    "UCA" => "Serine",
    "UCG" => "Serine",
    "UGG" => "Tryptophan",
    "UAU" => "Tyrosine",
    "UAC" => "Tyrosine",
    "UAA" => "STOP",
    "UAG" => "STOP",
    "UGA" => "STOP"
  }

  @doc """
  Given a codon, return the corresponding protein
  """
  @spec of_codon(String.t()) :: {atom, String.t()}
  for {codon, protein} <- @proteins do
    def of_codon(unquote(codon)), do: {:ok, unquote(protein)}
  end

  def of_codon(_), do: {:error, "invalid codon"}
end
