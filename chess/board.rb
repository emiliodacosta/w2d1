require_relative "piece.rb"
require "byebug"

class Board

  def initialize
    @grid = []
    Board.make_starting_grid(@grid)
  end

#   Array.new(8){Array.new(8)}

  def self.make_starting_grid(grid)
    black_rows = Array.new(2){Array.new(8)}
    black_rows.each_index do |i|
      black_rows[i].each_index do |j|
        black_rows[i][j] = Piece.new("black")
      end
    end
    empty_rows = Array.new(4){Array.new(8)}
    empty_rows.each_index do |i|
      empty_rows[i].each_index do |j|
        empty_rows[i][j] = NullPiece.new
      end
    end
    white_rows = Array.new(2){Array.new(8)}
    white_rows.each_index do |i|
      white_rows[i].each_index do |j|
        white_rows[i][j] = Piece.new("white")
      end
    end
    grid.concat(black_rows + empty_rows + white_rows)

  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos,val)
    row, col = pos
    @grid[row][col] = val
  end

  def move_piece(start_pos, end_pos)

  end

end
