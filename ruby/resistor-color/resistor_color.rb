module ResistorColor
  COLORS = %w[black
              brown
              red
              orange
              yellow
              green
              blue
              violet
              grey
              white].freeze

  def self.color_code(color_name)
    COLORS.index(color_name)
  end
end
