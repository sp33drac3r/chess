require "colorize"
require_relative 'cursorable.rb'


class Display
  include Cursorable

  def initialize(board)
    @board = board
    @cursor_pos = [0,0]
  end

  def build_grid
    @board.grid.map.with_index do |row, i|
      build_row(row, i)
    end
  end

  def build_row(row, i)
    row.map.with_index do |piece, j|
      color_options = colors_for(i,j)
      piece.to_s.colorize(color_options)
    end
  end

  def colors_for(i, j)
    if [i,j] == @cursor_pos
      bg = :light_red
   elsif @board.selected_piece_moves(@cursor_pos).include?([i,j])
     bg = :yellow
    elsif (i + j).odd?
      bg = :black
    else
      bg = :blue
    end
    { background: bg, color: :white }
  end

  def render
    system("clear")
    puts "Fill the grid!"
    puts "Arrow keys, WASD, or vim to move, space or enter to confirm."
    build_grid.each { |row| puts row.join }
  end
end
