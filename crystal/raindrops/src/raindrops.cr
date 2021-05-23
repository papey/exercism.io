module Raindrops
  CONVERT = [{3, "Pling"}, {5, "Plang"}, {7, "Plong"}]

  def self.convert(input : Int)
    drops = String.build do |str|
      CONVERT.each do |key, value|
        str << value if input % key == 0
      end
    end

    drops == "" ? input.to_s : drops
  end
end
