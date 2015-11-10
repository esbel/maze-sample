require_relative '../strategies/recursive_backtracking_strategy.rb'

class GenerateMazeService
  attr_accessor :width, :height, :strategy, :seed

  def initialize(width:, height:, strategy: RecursiveBacktrackingStrategy, seed: rand(999_999_999))
    @width, @height, @strategy, @seed = width, height, strategy, seed
  end

  def call
    grid = strategy.new(width, height, seed).call
  end
end
