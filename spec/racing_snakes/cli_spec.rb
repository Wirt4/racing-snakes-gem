# frozen_string_literal: true

require 'racing_snakes_gem'

RSpec.describe RacingSnakes::CLI do

  describe '.run' do
    let(:engine_double) {instance_double(RacingSnakes::Engine)}

    before do
      allow(RacingSnakes::Engine).to receive(:new).and_return(engine_double)
    end

    it 'initializes an engine' do
      allow(engine_double).to receive(:start_game_loop)
      expect(RacingSnakes::Engine).to receive(:new)

      described_class.run
    end

    it'calls start_game_loop on the engine instance' do
      allow(engine_double).to receive(:start_game_loop)
      described_class.run
      expect(engine_double).to have_received(:start_game_loop)

    end
  end
end
