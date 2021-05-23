module Bob
  def self.hey(str)
    case Remark.new(str)
    when .shouted_asking
      "Calm down, I know what I'm doing!"
    when .asking
      "Sure."
    when .shouting
      "Whoa, chill out!"
    when .empty
      "Fine. Be that way!"
    else
      "Whatever."
    end
  end

  class Remark
    getter(empty : Bool) { @text.blank? }
    getter(asking : Bool) { self.asking? }
    getter(shouting : Bool) { self.shouting? }
    getter(shouted_asking : Bool) { self.asking? && self.shouting }

    def initialize(@text : String)
    end

    def shouting?
      @text.each_char.any? { |c| c.ascii_letter? } && @text == @text.upcase
    end

    def asking?
      @text.ends_with?("?")
    end
  end
end
