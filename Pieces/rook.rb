class Rook < Piece
  include Slide

  def initialize(pos, color, board)
    super(pos, color, board)
    (pos == :white) ? (@icon = '♖') : (@icon = '♜')




end
