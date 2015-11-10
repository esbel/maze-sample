require_relative '../../app/strategies/basic_solver_strategy.rb'
require_relative '../spec_helper.rb'

RSpec.describe BasicSolverStrategy do
  let(:grid) { double("grid", length: 4, first: double(length: 4)) }
  let(:start) { double("start") }
  let(:finish) { double("finish") }

  subject { described_class.new(grid, start, finish) }

  describe '.new' do
    it 'stores supplied attributes' do
      expect(subject.grid).to eq(grid)
      expect(subject.start).to eq(start)
      expect(subject.finish).to eq(finish)
    end
  end

  describe '#call' do
    let(:start) { [0, 0] }
    let(:finish) { [4, 4] }

    context 'with solvable maze' do
      #  _________
      # |         |
      # |_|_|_|_| |
      # |  _| |_  |
      # | |_      |
      # |_____|_|_|
      #
      let(:grid) do
        [
          [6, 14, 14, 14, 10],
          [1, 1, 1, 1, 3],
          [6, 8, 2, 4, 11],
          [3, 4, 15, 14, 11],
          [5, 12, 9, 1, 1],
        ]
      end

      let(:expected_path) do
        [ [0, 0], [0, 0], [1, 0], [2, 0], [3, 0], [4, 0], [4, 1], [4, 2], [4, 3] ]
      end

      it 'returns a path to finish cell' do
        expect(subject.call).to eq(expected_path)
      end
    end

    context 'with unsolvable maze' do
      #  _________
      # |         |
      # |_|_|_|_| |
      # |  _| |_  |
      # | |_     _|
      # |_____|_|_|
      #
      let(:grid) do
        [
          [6, 14, 14, 14, 10],
          [1, 1, 1, 1, 3],
          [6, 8, 2, 4, 11],
          [3, 4, 15, 14, 9],
          [5, 12, 9, 1, 0],
        ]
      end

      it 'returns false' do
        expect(subject.call).to eq(false)
      end
    end
  end
end
