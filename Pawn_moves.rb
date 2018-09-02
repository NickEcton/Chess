require 'byebug'
module PawnMoves

  def moves
    result = []
    #if pawn is white it can move negatively, if black it moves positively
    if self.color == :black
      # debugger
      forward = [self.pos[0] + 1, self.pos[1]]
      right_strike = [self.pos[0] + 1, self.pos[1] + 1]
      left_strike = [self.pos[0] + 1, self.pos[1] + -1]

      if @board.valid_pos?(forward)
        result << forward if @board[forward].is_a?(NullPiece) || @board[forward].color != :black
      end

      if @board.valid_pos?(right_strike)
        unless @board[right_strike].is_a?(NullPiece)
          if @board[right_strike].color == :white
            result << right_strike
          end
        end
      end

      if @board.valid_pos?(left_strike)
        unless @board[left_strike].is_a?(NullPiece)
          if @board[left_strike].color == :white
            result << left_strike
          end
        end
      end



      # unless @board[[self.pos[0] + 1, self.pos[1] + 1]].is_a?(NullPiece)
      #   if @board[[self.pos[0] + 1, self.pos[1] + 1]].color == :white
      #     result << [self.pos[0] + 1, self.pos[1] + 1]
      #   end
      # end
      # unless @board[[self.pos[0] + 1, self.pos[1] + -1]].is_a?(NullPiece)
      #   if @board[[self.pos[0] + 1, self.pos[1] + -1]].color == :white
      #     result << [self.pos[0] + 1, self.pos[1] + -1]
      #   end
      # end
    end
    if self.color == :white

      forward = [self.pos[0] - 1, self.pos[1]]
      right_strike = [self.pos[0] - 1, self.pos[1] + 1]
      left_strike = [self.pos[0] - 1, self.pos[1] - 1]

      if @board.valid_pos?(forward)
        result << forward if @board[forward].is_a?(NullPiece) || @board[forward].color != :white
      end

      if @board.valid_pos?(right_strike)
        unless @board[right_strike].is_a?(NullPiece)
          if @board[right_strike].color == :black
            result << right_strike
          end
        end
      end

      if @board.valid_pos?(left_strike)
        unless @board[left_strike].is_a?(NullPiece)
          if @board[left_strike].color == :black
            result << left_strike
          end
        end
      end
    result
    end
  end
end
