# frozen_string_literal: true

# HighScores
class HighScores
  attr_reader :scores

  def initialize(scores)
    @scores = scores
  end

  def latest
    scores.last
  end

  def personal_best
    scores.max
  end

  def sort
    scores.sort.reverse
  end

  def personal_top_three
    scores.max 3
  end

  def latest_is_personal_best?
    latest == personal_best
  end
end
