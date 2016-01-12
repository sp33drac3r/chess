require_relative 'board.rb'
class Chess
  def initialize
    @board = Board.new
    @board.populate
    @board.display.render
  end

  def turn
    result = nil
    until result
      @board.display.render
      result = @board.display.get_input
    end
    result
  end

  def play
    while true
      start_pos = nil
      end_pos = nil
      start_pos = turn unless start_pos
      end_pos = turn unless end_pos
      @board.move(start_pos, end_pos) if start_pos && end_pos
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  chess = Chess.new
  chess.play
end
