require_relative 'Sliders'
require_relative 'stepers'
require_relative 'Pawn_moves'
require_relative 'board'
require 'byebug'
#require
require 'singleton'


class Piece

  attr_accessor :pos, :board, :color

  def initialize(color, pos, board)
    @color = color
    @pos = pos
    @board = board
  end

  def valid_moves

    val_moves = []
    pos_moves = move_dirs
    return val_moves if pos_moves.nil?
    pos_moves.each do |moves|
      val_moves << moves if move_into_check?(moves) == false
    end
    val_moves
  end

  def move_into_check?(end_pos)
    curr_pos = @pos
    # board_dup = Board.new
    # board_dup.grid = deep_dup(@board.grid)
    # @board = board_dup
    @board.move_piece(@color, @pos, end_pos)
    # debugger
    if @board.in_check?(@color)
      @board.move_piece!(@color, end_pos, curr_pos)
      true
    else
      @board.move_piece!(@color, end_pos, curr_pos)
      false
    end
  end

  def deep_dup(arr)
    arr.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
  end
end


class Bishop < Piece
  include SlidingPiece

  def move_dirs
    moves(true, nil)
  end

  def to_s
    if @color == :black
      "♝"
    else
      "♗"
    end
  end

end


class Rook < Piece
  include SlidingPiece

  def move_dirs
    moves(nil, true)
  end

  def to_s
    if @color == :black
      "♜"
    else
      "♖"
    end
  end


end

class Queen < Piece
  include SlidingPiece

  def move_dirs
    moves(true, true)
  end

  def to_s
    if @color == :black
      "♛"
    else
      '♕'
    end
  end

end

class King < Piece
  # attr_accessor :color
  include StepablePiece
  def move_dirs
    move_diffs = [[0,1], [1,0], [1,1], [0,-1], [-1,0], [-1,-1], [-1,1], [1,-1]]
    moves(move_diffs)
  end

  def to_s
    if @color == :black
      "♚"
    else
      '♔'
    end
  end


end


class Knight < Piece
  include StepablePiece
  def move_dirs
    move_diffs = [[1,2],[-1,2],[1,-2],[-1,-2],[2,1],[-2,1],[2,-1],[-2,-1]]
    moves(move_diffs)
  end

  def to_s
    if @color == :black
      "♞"
    else
      '♘'
    end
  end

end

class Pawn < Piece

  include PawnMoves
  def move_dirs

    # move_diffs = [[1,0],[1,-1],[1 ,1],[-1,0][-1,-1],[-1,1]]
    moves
  end


  def to_s
    if @color == :black
      "♟"
    else
      '♙'
    end
  end
end

class NullPiece < Piece
  include Singleton
  attr_reader :color, :symbol

  def inspect
    " "
  end
  def initialize
    @color
    @symbol
  end

  def to_s
    " "
  end


end
