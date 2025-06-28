# frozen_string_literal: true

RSpec.describe RacingSnakes::Snake do
  describe '#initialize' do
    subject(:snake) { described_class.new(RacingSnakes::PlayerOneButton.new, ['red'], []) }

    it 'direction is initialized as up' do
      expect(snake.direction).to eq(RacingSnakes::Directions::UP)
    end

    it 'samples from colors and sets it as the snake color' do
      colors = %w[red blue yellow]
      allow(colors).to receive(:sample).and_return('yellow')
      snake = described_class.new(RacingSnakes::PlayerOneButton.new, colors, [])
      expect(snake.color_name).to eq('Yellow')
    end

    it 'inialized with growing set to false' do
      expect(snake.growing).to be(false)
    end
  end
  describe '#crash?' do
    it 'there is no collision, crash is false' do 
      body = [RacingSnakes::Coordinates(0,0), RacingSnakes::Coordinates(0,2), RacingSnakes::Coordinates(0,3), RacingSnakes::Coordinates(0,4), RacingSnakes::Coordinates(0,5), ]
      snake = described_class.new(RacingSnakes::PlayerOneButton.new, ['red'], body)
      expect(snake.crashed?).to be(false)
    end
    it 'there is a collisioni, crash is true' do 
    end
  end
end
