class Result
  TEMPLATE = '|  %<played>s |  %<wins>s |  %<draws>s |  %<losses>s |  %<points>s'

  private_constant :TEMPLATE

  private

  attr_writer :played, :wins, :draws, :losses, :points

  def initialize
    @played = 0
    @wins = 0
    @draws = 0
    @losses = 0
    @points = 0
  end

  def add_win
    self.wins += 1
    self.points += 3
  end

  def add_draw
    self.draws += 1
    self.points += 1
  end

  def add_loss
    self.losses += 1
  end

  public

  attr_reader :played, :wins, :draws, :losses, :points

  def save(match_issue)
    self.played += 1
    send('add_%s' % match_issue)
  end

  def to_s
    TEMPLATE % {
      played: played,
      wins: wins,
      draws: draws,
      losses: losses,
      points: points
    }
  end
end

class Tournament
  REVERSE_MATCH_ISSUE = {
    win: :loss,
    loss: :win,
    draw: :draw
  }.freeze

  TABLE_TEMPLATE = "%<title>s| MP |  W |  D |  L |  P\n%<content>s"
  TABLE_TITLE = 'Team                           '

  FIELD_SEPARATOR = ';'

  private_constant :REVERSE_MATCH_ISSUE, :TABLE_TITLE, :TABLE_TEMPLATE, :FIELD_SEPARATOR

  def self.tally(raw_results)
    TABLE_TEMPLATE % { title: TABLE_TITLE, content: new(raw_results).report }
  end

  private

  attr_accessor :results

  def initialize(raw_results)
    @results = raw_results.lines(chomp: true).each_with_object({}) do |result, results|
      next if result.empty?

      team_1, team_2, match_issue = result.split(FIELD_SEPARATOR)
      results[team_1] = Result.new unless results[team_1]
      results[team_2] = Result.new unless results[team_2]
      results[team_1].save(match_issue.to_sym)
      results[team_2].save(REVERSE_MATCH_ISSUE[match_issue.to_sym])
    end
  end

  def sort
    results.sort_by { |team, result| [-result.points, team] }
  end

  public

  def report
    sort.sum('') do |team, result|
      "%<team>s%<padding>s%<result>s\n" % {
        team: team,
        padding: ' ' * (TABLE_TITLE.length - team.length),
        result: result
      }
    end
  end
end
