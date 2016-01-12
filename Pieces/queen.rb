require_relative "piece.rb"
require_relative "slide.rb"

class Queen < Piece
  include Slide

  def initialize(pos, color, board)
    super(pos, color, board)
    (color == :white) ? (@icon = '♕') : (@icon = '♛')
  end


  def all_moves
    diagonal_moves + orthogonal_moves
  end
  #add method to print all valid moves
end
