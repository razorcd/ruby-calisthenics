class RockPaperScissors

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ;  end
  def self.winner(player1, player2)
    rps = ["R", "P", "S"]
    unless rps.include?(player2[1]) && rps.include?(player1[1])
      raise NoSuchStrategyError, "Strategy must be one of R,P,S"
      return
    else
      pl1 = player1[1]
      pl2 = player2[1]
      if pl1 == "R"
        return player1 if pl2 == "S"
        return player2 if pl2 == "P"
      elsif pl1 == "S"
        return player1 if pl2 == "P"
        return player2 if pl2 == "R"
      elsif pl1 == "P"
        return player1 if pl2 == "R"
        return player2 if pl2 == "S"
      end
      return player1
    end
  end

  def self.tournament_winner(tournament)
    if tournament[0][0].class.to_s == "String"
      return self.winner(tournament[0], tournament[1])
    else
      arr = []
      arr << self.tournament_winner(tournament[0])
      arr << self.tournament_winner(tournament[1])
      return self.tournament_winner(arr)
      end

  end
end