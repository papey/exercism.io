module Hamming
  def self.compute(strand_a, strand_b)
    raise ArgumentError, 'strand length mismatch' unless strand_a.length == strand_b.length

    strand_a.chars.zip(strand_b.chars).count { |l1, l2| l1 != l2 }
  end
end
