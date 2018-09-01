require 'byebug'
module PawnMoves

  def moves
    result = []
    #if pawn is white it can move negatively, if black it moves positively
    if self.color == :black
      # debugger
      result << [self.pos[0] + 1, self.pos[1]]
      if @board[[self.pos[0] + 1, self.pos[1] + 1]].color == :white
        result << [self.pos[0] + 1, self.pos[1] + 1]
      end
      if @board[[self.pos[0] + 1, self.pos[1] + -1]].color == :white
        result << [self.pos[0] + 1, self.pos[1] + -1]
      end
    end
    if self.color == :white
      result << [self.pos[0] - 1, self.pos[1]]
      if @board[[self.pos[0] - 1, self.pos[1] + 1]].color == :black
        result << [self.pos[0] - 1, self.pos[1] + 1]
      end
      if @board[[self.pos[0] - 1, self.pos[1] - 1]].color == :black
        result << [self.pos[0] - 1, self.pos[1] - 1]
      end
    end
    result
  end
end
