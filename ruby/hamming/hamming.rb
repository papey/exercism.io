module Hamming
  def self.compute(strand_a, strand_b)
    raise ArgumentError, 'strand length mismatch' unless strand_a.length == strand_b.length

    strand_a.each_char.zip(strand_b.each_char).each.count { |l1, l2| l1 != l2 }
  end
end
