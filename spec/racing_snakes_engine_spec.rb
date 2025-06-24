# frozen_string_literal: true

require 'racing_snakes_gem'

RSpec.describe RacingSnakes::Engine do
  describe '#initialize' do
    let(:mock_window) { double('Ruby2D', set: nil) }
    let(:engine) { described_class.new(window_adapter: mock_window) }
    let(:mock_game) { double('Game', draw_snakes: nil) }

    before do
      RacingSnakes.configuration = RacingSnakes::Configuration.new

      allow(RacingSnakes::Game).to receive(:new).and_return(mock_game)
      allow(RacingSnakes::Game).to receive(:draw_snakes)
    end

    after do
      RacingSnakes.configuration = nil
    end

    it 'engine has a defined Game to manipulate'do
      expect(engine.game).not_to be_nil
    end

    it 'sets up the game window with default configurations' do
      expect(mock_window).to receive(:set).with(background: 'black')
      expect(mock_window).to receive(:set).with(width: 640)
      expect(mock_window).to receive(:set).with(height: 480)
      expect(mock_window).to receive(:set).with(fps_cap: 60)
      expect(mock_window).to receive(:set).with(fullscreen: false)

      described_class.new(window_adapter: mock_window)
    end

    it 'stores the game instance' do
      expect(engine.game).to eq(mock_game)
    end

    it'calls the draw_snakes method on game' do
       allow(mock_game).to receive(:draw_snakes)
       described_class.new(window_adapter: mock_window)
       expect(mock_game).to have_received(:draw_snakes)
    end
  end
  describe'#game_tick'do
    let(:game) do
      instance_double(
        RacingSnakes::Game,
        move: nil,
        draw_snakes: nil,
        is_paused?: false
      )     
    end
     
    let(:mock_window) { double('Ruby2D', set: nil, clear:nil) }
   
    subject(:engine) { described_class.new(window_adapter:mock_window) }
    
    before do
      RacingSnakes.configuration = RacingSnakes::Configuration.new
      allow(game).to receive(:draw_snakes)
      engine.instance_variable_set(:@game, game)
    end
    
    it 'calls move when game is not paused'do
      engine.game_tick
      expect(game).to have_received(:move)
    end

    it 'does not call move when game is paused'do
      allow(game).to receive(:is_paused?).and_return(true)
      engine.game_tick
      expect(game).not_to have_received(:move)
    end

    it 'draws snakes each game tick'do
      engine.game_tick
      expect(game).to have_received(:draw_snakes)
    end
  end
end

