# frozen_string_literal: true

require 'racing_snakes_gem'

RSpec.describe RacingSnakes::Engine do
  include_context 'window mock'
  include_context 'game mock'
  describe '#initialize' do
    subject(:engine) { described_class.new(window_adapter: mock_window) }

    before do
      RacingSnakes.configuration = RacingSnakes::Configuration.new

      allow(RacingSnakes::Game).to receive(:new).and_return(mock_game)
      allow(mock_game).to receive(:draw_snakes)
    end

    after do
      RacingSnakes.configuration = nil
    end

    it 'engine has a defined Game to manipulate' do
      expect(engine.game).not_to be_nil
    end

    it 'sets up the game window with default configurations' do
      engine
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
      engine
      expect(mock_game).to have_received(:draw_snakes)
    end
  end

  describe '#game_tick' do
    subject(:engine) { described_class.new(window_adapter: mock_window) }

    include_context 'game mock'

    before do
      RacingSnakes.configuration = RacingSnakes::Configuration.new

      allow(RacingSnakes::Game).to receive(:new).and_return(mock_game)
      engine.instance_variable_set(:@game, mock_game)
      allow(mock_game).to receive(:draw_snakes)
      allow(mock_game).to receive(:move)
      allow(mock_game).to receive(:draw_board)
      allow(mock_game).to receive(:eat_and_grow)
      allow(mock_game).to receive(:respawn_food)
      allow(mock_game).to receive(:paused?).and_return(false)
    end

    it 'calls move when game is not paused' do
      allow(mock_game).to receive(:paused?).and_return(false)
      engine.game_tick
      expect(mock_game).to have_received(:move)
    end

    it 'does not call move when game is paused' do
      allow(mock_game).to receive(:paused?).and_return(true)
      engine.game_tick
      expect(mock_game).not_to have_received(:move)
    end

    it 'draws snakes each game tick' do
      RSpec::Mocks.space.proxy_for(mock_game).reset
      allow(mock_game).to receive(:draw_snakes)
      allow(mock_game).to receive(:draw_board)
      allow(mock_game).to receive(:eat_and_grow)
      allow(mock_game).to receive(:respawn_food)
      allow(mock_game).to receive(:paused?).and_return(false)
      allow(mock_game).to receive(:move)
      allow(mock_game).to receive(:player_eats?).and_return(false)
      allow(mock_game).to receive(:food_time?).and_return(false)
      allow(mock_game).to receive(:stop_game)
      allow(mock_game).to receive(:is_collision?)

      engine.game_tick
      expect(mock_game).to have_received(:draw_snakes)
    end

    it 'draws board' do
      engine.game_tick
      expect(mock_game).to have_received(:draw_board)
    end

    it 'if game.player_eats is true, then call eat_and_grow' do
      allow(mock_game).to receive(:player_eats?).and_return(true)
      engine.game_tick
      expect(mock_game).to have_received(:eat_and_grow)
    end

    it 'if game.player_eats if false, then do not call eat_and_grow' do
      allow(mock_game).to receive(:player_eats?).and_return(false)
      engine.game_tick
      expect(mock_game).not_to have_received(:eat_and_grow)
    end

    it 'respawn food if it is food time' do
      allow(mock_game).to receive(:food_time?).and_return(true)
      engine.game_tick
      expect(mock_game).to have_received(:respawn_food)
    end

    it 'does notrespawn food if it is not food time' do
      allow(mock_game).to receive(:food_time?).and_return(false)
      engine.game_tick
      expect(mock_game).not_to have_received(:respawn_food)
    end

    it 'if collsion, then stop_game is called' do
      allow(mock_game).to receive(:is_collision?).and_return(true)
      engine.game_tick
      expect(mock_game).to have_received(:stop_game)
    end

    it 'if no collsion, then stop_game is not called' do
      allow(mock_game).to receive(:is_collision?).and_return(false)
      engine.game_tick
      expect(mock_game).not_to have_received(:stop_game)
    end
  end

  describe '#handle_key' do
    subject(:engine) { described_class.new(window_adapter: mock_window) }

    before do
      RacingSnakes.configuration = RacingSnakes::Configuration.new
      allow(RacingSnakes::Game).to receive(:new).and_return(mock_game)
      engine.instance_variable_set(:@game, mock_game)
      allow(mock_game).to receive(:handle_key)
    end

    it 'delegates the key press to game.handle_key' do
      engine.handle_key('left')
      expect(mock_game).to have_received(:handle_key).with('left')
    end
  end
end
