require_relative '../../app/strategies/recursive_backtracking_strategy.rb'
require_relative '../spec_helper.rb'

RSpec.describe RecursiveBacktrackingStrategy do
  let(:width) { 6 }
  let(:height) { 5 }
  let(:seed) { 84 }

  subject { described_class.new(width, height, seed) }

  describe '.new' do
    it 'stores supplied attributes' do
      expect(subject.width).to eq(width)
      expect(subject.height).to eq(height)
      expect(subject.seed).to eq(seed)
    end
  end

  describe '#call' do
    it 'generates a maze' do
      expected_maze = [
        [6, 14, 8, 2, 6, 8],
        [1, 7, 14, 15, 15, 8],
        [2, 1, 1, 1, 7, 8],
        [3, 2, 4, 14, 15, 10],
        [5, 13, 12, 9, 1, 1],
      ]

      expect(subject.call).to eq(expected_maze)
    end

    it 'sets maze width to supplied value' do
      expect(subject.call.first.length).to eq(width)
    end

    it 'sets maze height to supplied value' do
      expect(subject.call.length).to eq(height)
    end
  end
end
