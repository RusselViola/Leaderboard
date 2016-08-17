require 'spec_helper'
require_relative '../../lib/team'
require_relative '../../lib/leaderboard'
RSpec.describe Leaderboard do

leaderboard = Leaderboard.new

  describe ".new" do
    it "should create a new leaderboard" do
      expect(leaderboard).to be_a(Leaderboard)
    end
  end

  describe "generate_teams" do
    it "should transfer all teams info to @teams" do
    expect(leaderboard.generate_teams).to eq(leaderboard.teams)
    end
  end

generated_teams = leaderboard.generate_teams
teams_with_scores = leaderboard.generate_scores
  describe "generate_scores" do
    it "should calculate wins and losses for each team" do
      expect(teams_with_scores[0].wins).to eq(3)
      expect(teams_with_scores[0].losses).to eq(0)
    end
  end

teams_by_rank = leaderboard.generate_rankings
  describe "generate_rankings" do
    it "should organize the array into a hash by win ratio" do
      expect(teams_by_rank[1].name).to eq("Patriots")
      expect(teams_by_rank[2].name).to eq("Steelers")
      expect(teams_by_rank[3].name).to eq("Broncos")
    end
  end

  describe "summary" do
    it "display the leaderboard as a readable table" do
      leaderboard.generate_teams
      leaderboard.generate_scores
      leaderboard.generate_rankings
      expect(leaderboard.summary).to eq("---------------------------------------------------
| Name      Rank      Total Wins    Total Losses  |
| Patriots  1         3             0             |
| Steelers  2         1             1             |
| Broncos   3         1             2             |
| Colts     4         0             2             |
---------------------------------------------------")

    end
  end



end
