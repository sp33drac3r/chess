require_relative "piece.rb"
require_relative "slide.rb"

class Queen < Piece
  include Slide

  def initialize(pos, color, board)
    super(pos, color, board)
    (color == :white) ? (@icon = '♕') : (@icon = '♛')
  end


  def valid_move?(new_pos)
    super(new_pos)

    (orthogonal_moves + diagonal_moves).any? do |el|
      new_pos == el
    end

  end

  #add method to print all valid moves
end
