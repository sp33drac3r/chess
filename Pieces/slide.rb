require_relative 'piece.rb'
module Slide

  def orthogonal_moves
    orth_valid_moves = []

    @pos[0].upto(7) do |x|
      orth_valid_moves << [x, @pos[1]]
      if @board[[x, @pos[1]]].color == self.color
        orth_valid_moves.pop
        break
      elsif !@board[[x, @pos[1]]].color.nil?
        break
      end
    end

    @pos[0].downto(0) do |x|
      orth_valid_moves << [x, @pos[1]]
      if @board[[x, @pos[1]]].color == self.color
        orth_valid_moves.pop
        break
      elsif !@board[[x, @pos[1]]].color.nil?
        break
      end
    end

  end
end
