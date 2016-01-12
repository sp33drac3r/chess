require_relative 'jump.rb'
require_relative 'piece.rb'
class Knight < Piece
  include Jump

  VALID_POSITION =
  [
    [ 1, 2],
    [ 2, 1],
    [-1, 2],
    [ 2,-1],
    [ 1,-2],
    [-2, 1],
    [-1,-2],
    [-2,-1]
  ]

  def initialize(pos, color, board)
    super(pos, color, board)
    (pos == :white) ? (@icon = '♘') : (@icon = '♞')
  end

end
