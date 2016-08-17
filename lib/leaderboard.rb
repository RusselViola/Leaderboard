
require_relative 'team'
class Leaderboard
GAME_INFO = [
    {
      home_team: "Patriots",
      away_team: "Broncos",
      home_score: 17,
      away_score: 13
    },
    {
      home_team: "Broncos",
      away_team: "Colts",
      home_score: 24,
      away_score: 7
    },
    {
      home_team: "Patriots",
      away_team: "Colts",
      home_score: 21,
      away_score: 17
    },
    {
      home_team: "Broncos",
      away_team: "Steelers",
      home_score: 11,
      away_score: 27
    },
    {
      home_team: "Steelers",
      away_team: "Patriots",
      home_score: 24,
      away_score: 31
    }
]

  attr_reader :teams
  def initialize(teams = [])
  @teams = teams
  end

  def generate_teams
    team_info =[]
    team_names = []
    GAME_INFO.each do |game|
      team_names << game[:home_team]
      team_names << game[:away_team]
    end

    team_names = team_names.uniq!

    team_names.each do |name|
      team_info << Team.new(name)
    end
    @teams = team_info
  end

  def generate_scores
    GAME_INFO.each do |game|
        @teams.each do |team|
          if game[:home_score] > game[:away_score]
            if team.name == game[:home_team]
              team.add_win!
            elsif team.name == game[:away_team]
              team.add_loss!
            end
          elsif game[:home_score] < game[:away_score]
            if team.name == game[:home_team]
              team.add_loss!
            elsif team.name == game[:away_team]
              team.add_win!
            end
          end
        end
      end
      @teams = teams
    end

    def generate_rankings
      teams_by_rank = {}
      @teams.sort_by! { |team| team.win_ratio }
      @teams.reverse!
        @teams.each_with_index do |team, index|
          teams_by_rank[team] = index + 1
        end
      @teams = teams_by_rank.invert
    end


    def summary
      self.generate_teams
      self.generate_scores
      self.generate_rankings
      summary_string = "---------------------------------------------------\n" + "| Name      Rank      Total Wins    Total Losses  |\n"
    @teams.each do |rank, team|
      padding = ' '
      padding = padding * (10 - team.name.size)
      summary_string += "|"+" " +"#{team.name}" + "#{padding}" + "#{rank}" + "         " + "#{team.wins} " + "            " "#{team.losses}" + "             " "|\n"
    end
    summary_string += "---------------------------------------------------"
    summary_string
  end
end


leaderboard = Leaderboard.new
puts leaderboard.summary
