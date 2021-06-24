module Complement
  TO_RNA = { 'C' => 'G', 'G' => 'C', 'T' => 'A', 'A' => 'U' }.freeze

  def self.of_dna(dna_strand)
    dna_strand.chars.map(&TO_RNA).join
  end
end
