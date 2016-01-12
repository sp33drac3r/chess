require_relative "piece.rb"

class Pawn < Piece

  def initialize(pos, color, board)
    super(pos, color, board)
    (color == :white) ? (@icon = '♙') : (@icon = '♟')
    @moved = false
  end

  def valid_move?(new_pos)
    super(new_pos)

    valid_position.any? do |el|
      new_pos == el
    end
  end

  def valid_position
    if @color == :white
      white_moves
    elsif @color == :black
      black_moves
    end
  end

  private
  def white_moves
    valid_pos = []
    valid_pos << [@pos[0] - 1, @pos[1]] if @board[[@pos[0] - 1, @pos[1]]].color.nil?
    valid_pos << [@pos[0] - 1, @pos[1] + 1] if @board[[@pos[0] - 1, @pos[1]]].color == :black
    valid_pos << [@pos[0] - 1, @pos[1] - 1] if @board[[@pos[0] - 1, @pos[1]]].color == :black

    valid_pos << [@pos[0] - 2, @pos[1]] if @board[[@pos[0] - 1, @pos[1]]].color.nil? &&
                                           @board[[@pos[0] - 2, @pos[1]]].color.nil? &&
                                          !@moved

  end

  def black_moves
    valid_pos = []
    valid_pos << [@pos[0] + 1, @pos[1]] if @board[[@pos[0] + 1, @pos[1]]].color.nil?
    valid_pos << [@pos[0] + 1, @pos[1] + 1] if @board[[@pos[0] + 1, @pos[1]]].color == :white
    valid_pos << [@pos[0] + 1, @pos[1] - 1] if @board[[@pos[0] + 1, @pos[1]]].color == :white

    valid_pos << [@pos[0] + 2, @pos[1]] if @board[[@pos[0] + 1, @pos[1]]].color.nil? &&
                                           @board[[@pos[0] + 2, @pos[1]]].color.nil? &&
                                          !@moved
  end


end
