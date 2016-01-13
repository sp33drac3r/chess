require_relative 'piece.rb'
module Slide

  def orthogonal_moves
    slide_moves(0,1) + slide_moves(0,-1) +
    slide_moves(-1,0) + slide_moves(1, 0)
  end

  def diagonal_moves
    slide_moves(1,1) + slide_moves(1,-1) +
    slide_moves(-1,1) + slide_moves(-1, -1)
  end





  private

  def slide_moves(x, y)
    slide_valid_moves = []
    1.upto(7) do |i|
      #returns an array of all moves a sliding piece can do, includes collision logic
      break unless (pos[0] + (i * x)).between?(0,7) && (pos[1] + (i * y)).between?(0,7)
      slide_valid_moves << [@pos[0] + (i * x), @pos[1] + (i * y)]
      if @board[[@pos[0] + (i * x), @pos[1] + (i * y)]].color == self.color
        slide_valid_moves.pop
        break
      elsif !@board[[@pos[0] + (i * x), @pos[1] + (i * y)]].color.nil?
        break
      end
    end
    slide_valid_moves
  end

  # def orthogonal_moves_west
  #   orth_valid_moves_west = []
  #   @pos[0].upto(7) do |x|
  #     orth_valid_moves_west << [x, @pos[1]]
  #     if @board[[x, @pos[1]]].color == self.color
  #       orth_valid_moves_west.pop
  #       break
  #     elsif !@board[[x, @pos[1]]].color.nil?
  #       break
  #     end
  #   end
  #   orth_valid_moves_west
  # end
  #
  # def orthogonal_moves_east
  #   orth_valid_moves_east = []
  #   @pos[0].downto(0) do |x|
  #     orth_valid_moves_east << [x, @pos[1]]
  #     if @board[[x, @pos[1]]].color == self.color
  #       orth_valid_moves_east.pop
  #       break
  #     elsif !@board[[x, @pos[1]]].color.nil?
  #       break
  #     end
  #   end
  #   orth_valid_moves_east
  # end
  #
  # def orthogonal_moves_north
  #   orth_valid_moves_north = []
  #   @pos[1].upto(7) do |y|
  #     orth_valid_moves_north << [@pos[1], y]
  #     if @board[[@pos[1], y]].color == self.color
  #       orth_valid_moves_north.pop
  #       break
  #     elsif !@board[[@pos[1], y]].color.nil?
  #       break
  #     end
  #   end
  #   orth_valid_moves_north
  # end
  #
  # def orthogonal_moves_south
  #   orth_valid_moves_south = []
  #   @pos[1].downto(0) do |y|
  #     orth_valid_moves_south << [@pos[1], y]
  #     if @board[[@pos[1], y]].color == self.color
  #       orth_valid_moves_south.pop
  #       break
  #     elsif !@board[[@pos[1], y]].color.nil?
  #       break
  #     end
  #   end
  #   orth_valid_moves_south
  # end


end
