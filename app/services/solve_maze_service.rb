class SolveMazeService
  attr_accessor :maze, :start, :finish, :strategy

  def initialize(maze:, start:, finish:, strategy: BasicSolverStrategy)
    @maze, @start, @finish, @strategy = maze, start, finish, strategy
  end

  def call
    strategy.new.call(maze, start, finish)
  end
end
