require "racing_snakes_gem"

RSpec.describe RacingSnakes::CLI do

  describe ".run" do
    let(:engine_double) {instance_double(RacingSnakes::Engine)}
    before do
      allow(RacingSnakes::Engine).to receive(:new).and_return(engine_double)
    end

    it "initializes an engine" do
      allow(engine_double).to receive(:start_game_loop)
      expect(RacingSnakes::Engine).to receive(:new).and_return(engine_double)

      described_class.run
    end

    it"calls start_game_loop on the engine instance" do
      expect(engine_double).to receive(:start_game_loop)
      described_class.run
    end
  end
end
