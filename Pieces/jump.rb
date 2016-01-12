require_relative 'piece.rb'
module Jump
  def valid_move?(new_pos)
    super(new_pos)

    VALID_POSITION.any? do |el|
      new_pos == [el[0] + @pos[0], el[1] + @pos[1]]
    end
  end
end
