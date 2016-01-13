require_relative 'human_player.rb'
require_relative 'board.rb'

class Chess
  attr_accessor :board
  def initialize
    @board = Board.new
    @board.populate
    @board.display.render

    @black_player = HumanPlayer.new(:black, self)
    @white_player = HumanPlayer.new(:white, self)
    @counter = 1
  end

  def turn
    if @counter.odd?
      @board.current_player = :white
      # print "White player's turn"
      # sleep(1)
      return @white_player.take_turn
    else
      @board.current_player = :black
      # print "black player's turn"
      # sleep(1)
      return @black_player.take_turn
    end
  end

  def play
    while true
      start_pos = nil
      end_pos = nil
      start_pos = turn unless start_pos
      end_pos = turn unless end_pos
      if start_pos && end_pos
        @counter += 1 if @board.moved?(start_pos, end_pos)
      end
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  chess = Chess.new
  chess.play
end
