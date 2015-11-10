require_relative '../../lib/coordinates.rb'

# based on http://weblog.jamisbuck.org/2010/12/27/maze-generation-recursive-backtracking
class RecursiveBacktrackingStrategy
  attr_accessor :width, :height, :seed, :grid

  def initialize(width, height, seed = rand(999_999_999))
    @width, @height, @seed = width, height, seed
    @grid = Array.new(height) { Array.new(width, 0) }
    srand(seed)
  end

  def call
    stack = []
    stack.push([0, 0])

    loop do
      cx, cy = stack.pop
      directions = Coordinates::DIRECTIONS.shuffle

      directions.each do |direction|
        nx, ny = cx + Coordinates::DX[direction], cy + Coordinates::DY[direction]

        if ny.between?(0, grid.length-1) && nx.between?(0, grid[ny].length-1) && grid[ny][nx] == 0
          grid[cy][cx] |= direction
          grid[ny][nx] |= Coordinates::OPPOSITE[direction]

          stack.push([nx, ny])
        end
      end

      break if stack.empty?
    end

    grid
  end
end
