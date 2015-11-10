require_relative '../../app/services/solve_maze_service.rb'
require_relative '../../app/strategies/basic_solver_strategy.rb'
require_relative '../spec_helper.rb'

RSpec.describe SolveMazeService do
  let(:maze) { double("maze") }
  let(:start) { double("start_point") }
  let(:finish) { double("finish point") }
  let(:strategy) { BasicSolverStrategy }
  let(:strategy_instance) { double(BasicSolverStrategy) }

  subject { described_class.new(maze: maze, start: start, finish: finish, strategy: strategy) }

  before do
    allow(strategy).to receive(:new).and_return(strategy_instance)
  end

  describe '.new' do
    it 'stores supplied attributes' do
      expect(subject.maze).to eq(maze)
      expect(subject.start).to eq(start)
      expect(subject.finish).to eq(finish)
      expect(subject.strategy).to eq(strategy)
    end
  end

  describe '#call' do
    it 'calls the strategy using width, height and seed' do
      expect(strategy_instance).to receive(:call).with(maze, start, finish)

      subject.call
    end
  end
end
