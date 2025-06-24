require "racing_snakes_gem"

RSpec.describe RacingSnakes::Engine do
  describe "#initialize" do
    let(:mock_game) { double("Game") }
    let(:mock_window) { double("Ruby2D", set: nil) }
    let(:engine) { described_class.new(window_adapter: mock_window) }


    before do
       RacingSnakes.configuration = RacingSnakes::Configuration.new


      allow(RacingSnakes::Game).to receive(:new).and_return(mock_game)
    end

    after do
      RacingSnakes.configuration = nil
    end

    it "engine has a defined Game to manipulate"do
      expect(engine.game).not_to be_nil
    end

    it "sets up the game window with default configurations" do
      expect(mock_window).to receive(:set).with(background: "black")
      expect(mock_window).to receive(:set).with(width: 640)
      expect(mock_window).to receive(:set).with(height: 480)
      expect(mock_window).to receive(:set).with(fps_cap: 60)
      expect(mock_window).to receive(:set).with(fullscreen: false)

      described_class.new(window_adapter: mock_window)
    end

    it "stores the game instance" do
      expect(engine.game).to eq(mock_game)
    end
  end
end

