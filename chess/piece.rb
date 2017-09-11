require_relative "board.rb"

class Piece

  def initialize(color)
    @color = color

  end

  def to_s(type)

  end

  def empty?()
  end

  def symbol()
  end

  def valid_moves()
  end

  def move_into_check(to_pos)
  end

end

class NullPiece < Piece

  def initialize
  end

  def moves()
  end

end
