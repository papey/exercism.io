class Acronym
  def self.abbreviate input
    input.split(/\W+/).map(&:chr).join.upcase
  end
end
