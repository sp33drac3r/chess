require_relative "piece.rb"

class NilPiece < Piece
  def initialize(pos, color, board)
    super(pos, nil, board)
    @icon = nil
  end

  def to_s
    "   "
  end

  # def object_id
  #   "x"
  # end

end