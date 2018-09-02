
module SlidingPiece

  def moves(diagonal = nil, not_angle = nil)
    result = []
    non_angle_moves = []
    diagonal_moves = []


#CHECKS HORIZONTAL MOVEMENT


    (1..7).each do |i|
      up = [self.pos[0]-i, self.pos[1]]
      if @board.valid_pos?(up) && @board[up].is_a?(NullPiece)
        non_angle_moves << up
      elsif @board.valid_pos?(up) && !@board[up].is_a?(NullPiece)
        non_angle_moves << up if @board[up].color != self.color
        break
      elsif !@board.valid_pos?(up)
        break
      end
    end

    (1..7).each do |i|
      left = [self.pos[0], self.pos[1]-i]
      if @board.valid_pos?(left) && @board[left].is_a?(NullPiece)
        non_angle_moves << left
      elsif @board.valid_pos?(left) && !@board[left].is_a?(NullPiece)
        non_angle_moves << left if @board[left].color != self.color
        break
      elsif !@board.valid_pos?(left)
        break
      end
    end


    (1..7).each do |i|
      right = [self.pos[0], self.pos[1]+i]
      if @board.valid_pos?(right) && @board[right].is_a?(NullPiece)
        non_angle_moves << right
      elsif @board.valid_pos?(right) && !@board[right].is_a?(NullPiece)
        non_angle_moves << right if @board[right].color != self.color
        break
      elsif !@board.valid_pos?(right)
        break
      end
    end


    (1..7).each do |i|
      down = [self.pos[0]+i, self.pos[1]]
      if @board.valid_pos?(down) && @board[down].is_a?(NullPiece)
        non_angle_moves << down
      elsif @board.valid_pos?(down) && !@board[down].is_a?(NullPiece)
        non_angle_moves << down if @board[down].color != self.color
        break
      elsif !@board.valid_pos?(down)
        break
      end
    end

#CHECKS DIAGONAL MOVEMENT





    (1..7).each do |i|
      left_up = [self.pos[0]-i, self.pos[1]-i]
      if @board.valid_pos?(left_up)
        if @board[left_up].is_a?(NullPiece)
          diagonal_moves << left_up
        else
          if @board[left_up].color != self.color
            diagonal_moves << left_up
          end
        end
      else
        break
      end
    end

    (1..7).each do |i|
      right_up = [self.pos[0]-i, self.pos[1]+i]
      if @board.valid_pos?(right_up)
        if @board[right_up].is_a?(NullPiece)
          diagonal_moves << right_up
        else
          if @board[right_up].color != self.color
            diagonal_moves << right_up
          end
        end
      else
        break
      end
    end

    (1..7).each do |i|
      left_down = [self.pos[0]+i, self.pos[1]-i]
      if @board.valid_pos?(left_down)
        if @board[left_down].is_a?(NullPiece)
          diagonal_moves << left_down
        else
          if @board[left_down].color != self.color
            diagonal_moves << left_down
          end
        end
      else
        break
      end
    end

    (1..7).each do |i|
      right_down = [self.pos[0]+i, self.pos[1]+i]
      if @board.valid_pos?(right_down)
        if @board[right_down].is_a?(NullPiece)
          diagonal_moves << right_down
        else
          if @board[right_down].color != self.color
            diagonal_moves << right_down
          end
        end
      else
        break
      end
    end

    unless non_angle_moves.empty?
      result += non_angle_moves if not_angle
    end
    unless diagonal_moves.empty?
      result += diagonal_moves if diagonal
    end

    result
  end
end
