module RnaComplement
  def self.of_dna(input)
    return input.tr("GCTA", "CGAU")
  end
end
