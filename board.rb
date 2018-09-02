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

  def in_check?(color)
    king_pos = find_king(color)
    (0..7).each do |y|
      (0..7).each do |x|
        if @grid[y][x].color != color && @grid[y][x].color != nil
          # debugger
          if @grid[y][x].move_dirs.nil?
            next
          else
            @grid[y][x].move_dirs.each do |pos|
              return true if pos == king_pos
            end
          end
        end
      end
    end
    false
  end

  def find_king(color)
    king_pos = []
    (0..7).each do |y|
      break unless king_pos.empty?
      (0..7).each do |x|
        if @grid[y][x].is_a?(King)
          if @grid[y][x].color == color
            king_pos += [y,x]
            break
          end
        end
      end
    end
    king_pos
  end

  def checkmate?(color)
    if in_check?(color)
      (0..7).each do |y|
        (0..7).each do |x|
          if @grid[y][x].is_a?(NullPiece)
          elsif @grid[y][x].color == color
            return false if !@grid[y][x].valid_moves.empty?
          end
        end
      end
    else
      return false
    end
    return true
  end

  def move_piece(color, start_pos, end_pos)
    begin
      if self[start_pos].is_a?(NullPiece) || self[start_pos].color != color
        raise StandardError, "Choose a start position that contains a #{color} piece."
      end
      if self[start_pos].valid_moves.include?(end_pos) == false
        raise StandardError, "You can't move to that position."
      end
    rescue StandardError => e
      puts e
      retry
    end
    self[start_pos].pos = end_pos
    self[end_pos].pos = start_pos
    self[end_pos], self[start_pos] = self[start_pos], self
  end

  def move_piece!(color, start_pos, end_pos)
    self[start_pos].pos = end_pos
    self[end_pos].pos = start_pos
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
