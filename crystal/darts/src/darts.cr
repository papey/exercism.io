module Darts
  def self.score(x : Float, y : Float) : Int
    case (x*x + y*y)
    when ..1   then 10
    when ..25  then 5
    when ..100 then 1
    else            0
    end
  end
end
