require 'byebug'
module StepablePiece

  def moves(move_diffs)

    result = []
    move_diffs.each do |diff|
      new_pos = [self.pos[0]+diff[0], self.pos[1]+diff[1]]
      if self.board.valid_pos?(new_pos)
        if self.board[new_pos].is_a?(NullPiece) ||                self.board[new_pos].color != self.color
          result << new_pos
        end
      end 
    end
    result
  end

end
