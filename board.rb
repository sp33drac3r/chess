require_relative "all_pieces.rb"
require_relative 'display.rb'

class Board
  attr_reader :grid, :display

  def initialize(start = true)
    @grid = Array.new(8) {Array.new(8)}
    @display = Display.new(self)
    populate if start
  end


  def populate
    all_pieces = make_black_team + make_nil + make_white_team
    @grid.each_with_index do |row, i|
      row.each_with_index do |pos, j|
        self[[i,j]] = all_pieces.shift
      end
    end
  end

  def move(start_pos, end_pos)
    if self[start_pos].valid_move?(end_pos)
      self[end_pos].die
      self[end_pos] = self[start_pos]
      self[start_pos] = NilPiece.new(start_pos, nil, self)
      self[end_pos].pos = end_pos
    end
  end

  def [] pos
    row,col = pos
    @grid[row][col]
  end

  def []= pos, value
    row,col = pos
    @grid[row][col] = value
  end

  private

  def make_black_team
    [
      Rook.new([0,0], :black, self),
      Knight.new([0,1], :black, self),
      Bishop.new([0,2], :black, self),
      Queen.new([0,3], :black, self),
      King.new([0,4], :black, self),
      Bishop.new([0,5], :black, self),
      Knight.new([0,6], :black, self),
      Rook.new([0,7], :black, self),
      Pawn.new([1,0], :black, self),
      Pawn.new([1,1], :black, self),
      Pawn.new([1,2], :black, self),
      Pawn.new([1,3], :black, self),
      Pawn.new([1,4], :black, self),
      Pawn.new([1,5], :black, self),
      Pawn.new([1,6], :black, self),
      Pawn.new([1,7], :black, self)
    ]
  end

  def make_white_team
    [
      Pawn.new([6,0], :white, self),
      Pawn.new([6,1], :white, self),
      Pawn.new([6,2], :white, self),
      Pawn.new([6,3], :white, self),
      Pawn.new([6,4], :white, self),
      Pawn.new([6,5], :white, self),
      Pawn.new([6,6], :white, self),
      Pawn.new([6,7], :white, self),
      Rook.new([7,0], :white, self),
      Knight.new([7,1], :white, self),
      Bishop.new([7,2], :white, self),
      Queen.new([7,3], :white, self),
      King.new([7,4], :white, self),
      Bishop.new([7,5], :white, self),
      Knight.new([7,6], :white, self),
      Rook.new([7,7], :white, self)
    ]
  end

  def make_nil
    blank_spaces = []
    4.times do |row|
      8.times do |col|
        blank_spaces << NilPiece.new([row,col], nil, self)
      end
    end
    blank_spaces
  end



end
