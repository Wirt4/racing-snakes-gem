require "racing_snakes_gem"

RSpec.describe RacingSnakes::CLI do
  describe ".run" do
    it "initializes an engine" do
      engine_double = instance_double(RacingSnakes::Engine)

      expect(RacingSnakes::Engine).to receive(:new).and_return(engine_double)

      described_class.run
    end
  end
end

