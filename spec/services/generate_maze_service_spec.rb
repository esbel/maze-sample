require_relative '../../app/services/generate_maze_service.rb'
require_relative '../../app/strategies/recursive_backtracking_strategy.rb'
require_relative '../spec_helper.rb'

RSpec.describe GenerateMazeService do
  let(:width) { 6 }
  let(:height) { 5 }
  let(:seed) { 84 }
  let(:strategy) { RecursiveBacktrackingStrategy }
  let(:strategy_instance) { double(RecursiveBacktrackingStrategy) }

  subject { described_class.new(width: width, height: height, strategy: strategy, seed: seed) }

  before do
    allow(strategy).to receive(:new).and_return(strategy_instance)
  end

  describe '.new' do
    it 'stores supplied attributes' do
      expect(subject.width).to eq(width)
      expect(subject.seed).to eq(seed)
      expect(subject.height).to eq(height)
      expect(subject.strategy).to eq(strategy)
    end
  end

  describe '#call' do
    it 'calls the strategy using width, height and seed' do
      expect(strategy_instance).to receive(:call).with(width, height, seed)

      subject.call
    end
  end
end
