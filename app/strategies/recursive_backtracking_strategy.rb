# based on http://weblog.jamisbuck.org/2010/12/27/maze-generation-recursive-backtracking
class RecursiveBacktrackingStrategy
  N, S, E, W = 1, 2, 4, 8
  DX         = { E => 1, W => -1, N =>  0, S => 0 }
  DY         = { E => 0, W =>  0, N => -1, S => 1 }
  OPPOSITE   = { E => W, W =>  E, N =>  S, S => N }

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
      directions = [N, S, E, W].shuffle

      directions.each do |direction|
        nx, ny = cx + DX[direction], cy + DY[direction]

        if ny.between?(0, grid.length-1) && nx.between?(0, grid[ny].length-1) && grid[ny][nx] == 0
          grid[cy][cx] |= direction
          grid[ny][nx] |= OPPOSITE[direction]

          stack.push([nx, ny])
        end
      end

      break if stack.empty?
    end

    grid
  end
end
