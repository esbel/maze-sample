require_relative '../../lib/coordinates.rb'

class BasicSolverStrategy
  attr_accessor :grid, :start, :finish, :visited_cells

  def initialize(grid, start, finish)
    @grid, @start, @finish = grid, start, finish
    @visited_cells = Array.new(height) { Array.new(width, false) }
  end

  def call
    path = [start]

    x, y = start

    loop do
      break if [x, y] == finish

      visited_cells[y][x] = true

      if can_move?(x, y, Coordinates::W)
        path.push [x,y]
        x += Coordinates::DX[Coordinates::W]
        y += Coordinates::DY[Coordinates::W]
      elsif can_move?(x, y, Coordinates::N)
        path.push [x,y]
        x += Coordinates::DX[Coordinates::N]
        y += Coordinates::DY[Coordinates::N]
      elsif can_move?(x, y, Coordinates::E)
        path.push [x,y]
        x += Coordinates::DX[Coordinates::E]
        y += Coordinates::DY[Coordinates::E]
      elsif can_move?(x, y, Coordinates::S)
        path.push [x,y]
        x += Coordinates::DX[Coordinates::S]
        y += Coordinates::DY[Coordinates::S]
      else
        return false if path.empty? # no solutions

        x, y = path.pop
      end
    end

    path
  end

  private

  def can_move?(x, y, direction)
    (grid[y][x] & direction > 0) && !visited_cells[y+Coordinates::DY[direction]][x+Coordinates::DX[direction]]
  end

  def height
    grid.length
  end

  def width
    grid.first.length
  end
end
