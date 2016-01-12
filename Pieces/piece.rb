class Piece
  attr_reader :color, :icon
  attr_accessor :pos
  def initialize(pos, color, board)
    @pos = pos
    @color = color
    @board = board
  end

  def to_s
    " #{@icon} "
  end

  def die
    board[pos] = nil #add nil piece
    @pos = nil
  end

  def valid_move?(new_pos)
    return false unless new_pos[0].between?(0,7) && new_pos[1].between?(0,7)
    return false if @board[new_pos].color == @color
    # return false if move puts king in check
  end

  # def move(new_pos)
  #   @pos = new_pos
  #   @board[new_pos] = self
  # end
end
