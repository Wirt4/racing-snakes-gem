# frozen_string_literal: true

RSpec.describe RacingSnakes::Clock do
  describe '#initialize' do
    subject(:clock) { described_class.new }

    it 'clock defaults with time at 0' do
      expect(clock.time).to eq(0)
    end

    it 'clock will initialized with loaded time' do
      loaded_clock = described_class.new(7)
      expect(loaded_clock.time).to eq(7)
    end
  end

  describe '#tick' do
    subject(:clock) { described_class.new }

    it 'increment from 0 to 1' do
      clock.tick
      expect(clock.time).to eq(1)
    end

    it 'increment from 7 to 8' do
      loaded_clock = described_class.new(7)

      loaded_clock.tick
      expect(loaded_clock.time).to eq(8)
    end
  end

  describe '#reset' do
    it 'clock after reset has tick == 0' do
      clock = described_class.new(10)
      clock.reset
      expect(clock.time).to eq(0)
    end
  end

  describe '#food_tim?e' do
    let(:fixed_randomizer) { -> { 400 } }

    it 'returns true when time > cutoff' do
      clock = described_class.new(401, fixed_randomizer)
      expect(clock.food_time?).to be(true)
    end

    it 'returns false when time <= cutoff' do
      clock = described_class.new(400, fixed_randomizer)
      expect(clock.food_time?).to be(false)
    end
  end
end
