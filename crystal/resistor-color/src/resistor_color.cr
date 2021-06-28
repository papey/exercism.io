module ResistorColor
  COLORS = %w[
    black
    brown
    red
    orange
    yellow
    green
    blue
    violet
    grey
    white
  ]

  def self.color_code(color : String) : Int32 | Nil
    COLORS.index(color)
  end

  def self.colors
    COLORS
  end
end
