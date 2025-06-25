RSpec.describe RacingSnakes::Clock do
  describe '#initialize' do
    subject(:clock) { described_class.new() }
    it 'clock defaults with time at 0' do
      expect(clock.time).to eq(0)
    end
    it 'clock will initialized with loaded time' do
      loaded_clock = described_class.new(7)
      expect(loaded_clock.time).to eq(7)
    end
  end
end
