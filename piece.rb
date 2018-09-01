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
#
# def inspect
#   "P"
# end

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
    debugger
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
