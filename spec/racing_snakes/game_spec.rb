require 'racing_snakes_gem'
RSpec.describe RacingSnakes::Game do
  describe '#initialize' do
    subject(:game) { described_class.new }

    include_context 'clock mock'

    before do
      allow(RacingSnakes::Clock).to receive(:new).and_return(mock_clock)
    end

    it 'initalizes a new clock object' do
      expect(game.clock).to equal(mock_clock)
    end
  end
end
