module Complement
  @@to_rna = { 'C' => 'G', 'G' => 'C', 'T' => 'A', 'A' => 'U' }

  def self.of_dna(dna_strand)
    dna_strand.chars.map { |letter| @@to_rna[letter] }.join
  end
end
