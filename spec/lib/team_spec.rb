require 'spec_helper'

RSpec.describe Team do
  let(:team) {Team.new("Steelers")}
  describe ".new" do
    team = Team.new("Patriots")
    it 'has a name' do
      expect(team.name).to eq("Patriots")
    end
    it 'has a rank' do
      expect(team.rank).to eq(nil)
    end
    it 'has a wins count' do
      expect(team.wins).to eq(0)
    end
    it 'has a loss count' do
      expect(team.losses).to eq(0)
    end
  end

  describe "#add_win!" do
    it "should add 1 to the 'wins' value of the team object" do
      team.add_win!
      expect(team.wins).to eq(1)
    end
  end

  describe "#add_loss!" do
    it "should add 1 to the 'loss' value of the team object" do
      team.add_loss!
      expect(team.losses).to eq(1)
    end
  end

  describe "#win_ratio" do
    it "should take a ratio of wins/losses" do
      expect(team.win_ratio).to eq(1)
    end
  end

end
