module Pangram
  def self.pangram?(input : String)
    (('a'..'z').to_set - input.downcase.each_char.to_set).empty?
  end
end
