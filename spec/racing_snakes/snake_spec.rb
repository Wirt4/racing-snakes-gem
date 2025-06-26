# frozen_string_literal: true

RSpec.describe RacingSnakes::Snake do
  describe '#initialize' do
    subject(:snake) { described_class.new(RacingSnakes::PlayerOneButton.new, ['red']) }

    it 'direction is initialized as up' do
      expect(snake.direction).to eq(RacingSnakes::Directions::UP)
    end
    it 'samples from colors and sets it as the snake color' do
      colors = ['red', 'blue', 'yellow']
      allow(colors).to receive(:sample).and_return('yellow')
      snake = described_class.new(RacingSnakes::PlayerOneButton.new, colors)
      expect(snake.color_name).to eq('Yellow')
    end
  end
end
