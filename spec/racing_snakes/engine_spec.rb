# frozen_string_literal: true

require 'racing_snakes_gem'

RSpec.describe RacingSnakes::Engine do
  describe '#initialize' do
    let(:mock_window) { instance_double(Ruby2D::Window, set: nil) }
    let(:engine) { described_class.new(window_adapter: mock_window) }
    let(:mock_game) { instance_double(RacingSnakes::Game, draw_snakes: nil) }

    before do
      RacingSnakes.configuration = RacingSnakes::Configuration.new

      allow(RacingSnakes::Game).to receive(:new).and_return(mock_game)
      allow(RacingSnakes::Game).to receive(:draw_snakes)
    end

    after do
      RacingSnakes.configuration = nil
    end

    it 'engine has a defined Game to manipulate' do
      expect(engine.game).not_to be_nil
    end

    it 'sets up the game window with default configurations' do
      described_class.new(window_adapter: mock_window)

      {
        background: 'black',
        width: 640,
        height: 480,
        fps_cap: 60,
        fullscreen: false
      }.each do |key, value|
        expect(mock_window).to have_received(:set).with(key => value)
      end
    end

    it 'stores the game instance' do
      expect(engine.game).to eq(mock_game)
    end

    it 'calls the draw_snakes method on game' do
      allow(mock_game).to receive(:draw_snakes)
      described_class.new(window_adapter: mock_window)
      expect(mock_game).to have_received(:draw_snakes)
    end
  end

  describe '#game_tick' do
    subject(:engine) { described_class.new(window_adapter: mock_window) }

    let(:game) do
      instance_double(
        RacingSnakes::Game,
        move: nil,
        draw_snakes: nil,
        paused?: false,
        draw_board: nil,
        player_eats?: false,
        eat_and_grow: nil
      )
    end

    let(:mock_window) { double('Ruby2D', set: nil, clear: nil) }

    before do
      RacingSnakes.configuration = RacingSnakes::Configuration.new
      allow(game).to receive(:draw_snakes)
      allow(game).to receive(:draw_board)
      allow(game).to receive(:eat_and_grow)
      engine.instance_variable_set(:@game, game)
    end

    it 'calls move when game is not paused' do
      engine.game_tick
      expect(game).to have_received(:move)
    end

    it 'does not call move when game is paused' do
      allow(game).to receive(:paused?).and_return(true)
      engine.game_tick
      expect(game).not_to have_received(:move)
    end

    it 'draws snakes each game tick' do
      engine.game_tick
      expect(game).to have_received(:draw_snakes)
    end

    it 'draws board' do
      engine.game_tick
      expect(game).to have_received(:draw_board)
    end

    it 'if game.player_eats is true, then call eat_and_grow' do
      allow(game).to receive(:player_eats?).and_return(true)
      engine.game_tick
      expect(game).to have_received(:eat_and_grow)
    end

    it 'if game.player_eats if false, then do not call eat_and_grow' do
      allow(game).to receive(:player_eats?).and_return(false)
      engine.game_tick
      expect(game).not_to have_received(:eat_and_grow)
    end
  end
end
