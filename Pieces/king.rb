require_relative 'jump.rb'
require_relative 'piece.rb'
class King < Piece
  include Jump

  VALID_POSITION =
  [
    [ 1, 1],
    [ 1, 0],
    [ 1,-1],
    [ 0,-1],
    [-1,-1],
    [ 0,-1],
    [-1, 1],
    [ 0, 1]
  ]

  def initialize(pos, color, board)
    super(pos, color, board)
    (color == :white) ? (@icon = '♔') : (@icon = '♚')
    @moved = false
  end

end
