class Team
  attr_reader :name, :rank, :wins, :losses
  def initialize(name, rank = nil, wins = 0, losses = 0)
    @name = name
    @rank = rank
    @wins = wins
    @losses = losses
  end
  #
  def add_win!
    @wins += 1
  end

  def add_loss!
    @losses += 1
  end

  def win_ratio
    (@wins + 1.0) / (@losses + 1.0)
  end

  # rank

end
