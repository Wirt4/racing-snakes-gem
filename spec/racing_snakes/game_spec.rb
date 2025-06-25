# frozen_string_literal: true

require 'racing_snakes_gem'
RSpec.describe RacingSnakes::Game do
  describe '#initialize' do
    subject(:game) { described_class.new }

    include_context 'clock mock'
    include_context 'snake mock'
    before do
      allow(RacingSnakes::Clock).to receive(:new).and_return(mock_clock)
      allow(RacingSnakes::Board).to receive(:new)
    end

    it 'initalizes a new clock object' do
      expect(game.clock).to equal(mock_clock)
    end

    it 'initializes two snakes' do
      snake_args = []
      allow(RacingSnakes::Snake).to receive(:new) do |*args|
        snake_args << args
        double(RacingSnakes::Snake)
      end

      game

      expect(snake_args[0][0]).to eq(RacingSnakes::PlayerIds::PLAYER_ONE)
      expect(snake_args[1][0]).to eq(RacingSnakes::PlayerIds::PLAYER_TWO)
    end
  end
end
