#This is the class that defines players

class Player
  attr_accessor :name, :redScore, :coinScore, :wonderScore, :blueScore, :yellowScore, :purpleScore, :cogs, :compass, :tablets, :totalScore
  attr_accessor :cogScore, :compassScore, :tabletScore, :setScore, :scienceScore

  def initialize name
    @name = name
    @cogScore = 0
    @compassScore = 0
    @tabletScore = 0
    @setScore = 0
    @totalScore = 0
  end

  def scoreCogs
    @cogScore = self.cogs * self.cogs
  end

  def scoreCompass
    @compassScore = self.compass * self.compass
  end

  def scoreTablet
    @tabletScore = self.tablets * self.tablets
  end

  def scoreSets
    for i in 0..6
      if (@cogs > i) && (@compass > i) && (@tablets > i)
        @setScore += 7
      end
    end
    return @setScore
  end

  def scoreScience
    @scienceScore = @setScore + @cogScore + @compassScore + @tabletScore
  end

  def sayTotalScore
    @totalScore = @redScore + @coinScore + @wonderScore + @blueScore + @yellowScore + @purpleScore + @scienceScore
  end
end

