require 'byebug'
module StepablePiece

  def moves(move_diffs)

    result = []
    move_diffs.each do |diff|
      new_pos = [self.pos[0]+diff[0], self.pos[1]+diff[1]]
      result << new_pos if self.board.valid_pos?(new_pos) && self.board[new_pos].is_a?(NullPiece)
    end
    result 
  end

end
