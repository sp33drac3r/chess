require_relative 'piece.rb'
module Jump
  def valid_move?(new_pos)
    super(new_pos)

    possible_moves.any? do |el|
      new_pos == el
    end
  end

  def possible_moves
    move_dirs.map do |el|
      [el[0] + @pos[0], el[1] + @pos[1]] unless !(el[0] + @pos[0]).between?(0,7) ||
       !(el[1] + @pos[1]).between?(0,7) ||
       @board[[el[0] + @pos[0], el[1] + @pos[1]]].color == @color
    end
  end
end
