require_relative "./Pieces/nil_piece.rb"
require_relative 'display.rb'

class Board
  attr_reader :grid, :display
  def initialize
    @grid = Array.new(8) {Array.new(8)}
    @display = Display.new(self)
  end


  def populate
    @grid.each_with_index do |row, i|
      row.each_with_index do |pos, j|
        self[[i,j]] = NilPiece.new([i,j], nil, self)
      end
    end
  end



  def [] pos
    row,col = pos
    @grid[row][col]
  end

  def []= pos, value
    row,col = pos
    @grid[row][col] = value
  end

end
