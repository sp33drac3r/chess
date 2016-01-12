require_relative 'piece.rb'
module Slide

  def orthogonal_moves
    orthogonal_moves_west + orthogonal_moves_east +
    orthogonal_moves_north + orthogonal_moves_south
  end

  def diagonal_moves
    diagonal_move(1,1) + diagonal_move(1,-1) +
    diagonal_move(-1,1) + diagonal_move(-1, -1)
  end

  private

  def diagonal_move(x, y)
    diag_valid_move = []
    1.upto(7) do |i|
      break unless (pos[0] + (i * x)).between?(0,7) && (pos[1] + (i * y)).between?(0,7)
      diag_valid_move << [@pos[0] + (i * x), @pos[1] + (i * y)]
      if @board[[@pos[0] + (i * x), @pos[1] + (i * y)]].color == self.color
        diag_valid_move.pop
        break
      elsif !@board[[@pos[0] + (i * x), @pos[1] + (i * y)]].color.nil?
        break
      end
    end
    diag_valid_move
  end

  def orthogonal_moves_west
    orth_valid_moves_west = []
    @pos[0].upto(7) do |x|
      orth_valid_moves_west << [x, @pos[1]]
      if @board[[x, @pos[1]]].color == self.color
        orth_valid_moves_west.pop
        break
      elsif !@board[[x, @pos[1]]].color.nil?
        break
      end
    end
    orth_valid_moves_west
  end

  def orthogonal_moves_east
    orth_valid_moves_east = []
    @pos[0].downto(0) do |x|
      orth_valid_moves_east << [x, @pos[1]]
      if @board[[x, @pos[1]]].color == self.color
        orth_valid_moves_east.pop
        break
      elsif !@board[[x, @pos[1]]].color.nil?
        break
      end
    end
    orth_valid_moves_east
  end

  def orthogonal_moves_north
    orth_valid_moves_north = []
    @pos[1].upto(7) do |y|
      orth_valid_moves_north << [@pos[1], y]
      if @board[[@pos[1], y]].color == self.color
        orth_valid_moves_north.pop
        break
      elsif !@board[[@pos[1], y]].color.nil?
        break
      end
    end
    orth_valid_moves_north
  end

  def orthogonal_moves_south
    orth_valid_moves_south = []
    @pos[1].downto(0) do |y|
      orth_valid_moves_south << [@pos[1], y]
      if @board[[@pos[1], y]].color == self.color
        orth_valid_moves_south.pop
        break
      elsif !@board[[@pos[1], y]].color.nil?
        break
      end
    end
    orth_valid_moves_south
  end


end
