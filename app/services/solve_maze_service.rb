require_relative '../strategies/basic_solver_strategy.rb'

class SolveMazeService
  attr_accessor :maze, :start, :finish, :strategy

  def initialize(maze:, start:, finish:, strategy: BasicSolverStrategy)
    @maze, @start, @finish, @strategy = maze, start, finish, strategy
  end

  def call
    strategy.new(maze, start, finish).call
  end
end
