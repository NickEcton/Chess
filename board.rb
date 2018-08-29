require_relative "piece"
require_relative "display"
require_relative "cursor"
class Board

  attr_accessor :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) }
    set_up
  end

  def set_up
    (0..7).each do |i|
      if i == 0 || i == 7
        if i == 0
          color = :white
        elsif i == 7
          color = :black
        end
        @grid[i][0] = Rook.new(color, [i, 0], self)
        @grid[i][1] = Knight.new(color, [i, 1], self)
        @grid[i][2] = Bishop.new(color, [i, 2], self)
        @grid[i][3] = Queen.new(color, [i, 3], self)
        @grid[i][4] = King.new(color, [i, 4], self)
        @grid[i][5] = Bishop.new(color, [i, 5], self)
        @grid[i][6] = Knight.new(color, [i, 6], self)
        @grid[i][7] = Rook.new(color, [i, 7], self)
      elsif i ==1 || i == 6
        if i == 1
          color = :white
        elsif i == 6
          color = :black
        end
        @grid[i].each_with_index { |_el, idx| @grid[i][idx] = Pawn.new(color, [i, idx], self)}
      else
        @grid[i].each_with_index { |_el, idx| @grid[i][idx] = NullPiece.instance }
      end
    end
  end

  def move_piece(color, start_pos, end_pos)
    #begin
    p start_pos
    p end_pos
      raise StandardError, "Choose a start position that contains a piece." if self[start_pos].is_a?(NullPiece)
      raise StandardError, "You can't move to that position." unless self[end_pos].is_a?(NullPiece)
    #rescue StandardError => e
      #puts e
      #retry
    #end

    move_piece!(color, start_pos, end_pos)
  end

  def move_piece!(color, start_pos, end_pos)
    self[end_pos], self[start_pos] = self[start_pos], self[end_pos]
  end

  def valid_pos?(pos)
    pos.none? { |el| el > 7 || el < 0}
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

end
