require_relative 'board.rb'
class Chess
  def initialize
    @board = Board.new
    @board.populate
    @board.display.render
  end

  def play
    result = nil
    until result
      @board.display.render
      result = @board.display.get_input
    end
    result
  end
end

if __FILE__ == $PROGRAM_NAME
  chess = Chess.new
  chess.play
end
