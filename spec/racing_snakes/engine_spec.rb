# frozen_string_literal: true

require 'racing_snakes_gem'
require 'ostruct'
RSpec.describe RacingSnakes::Engine do
  include_context 'with a window mock'
  include_context 'with a game mock'
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
        width: 1920,
        height: 1080,
        fps_cap: 20,
        fullscreen: true
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

    include_context 'with a game mock'

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
      allow(mock_game).to receive_messages(draw_snakes: nil, draw_board: nil, eat_and_grow: nil, respawn_food: nil,
                                           paused?: false, move: nil, player_has_eaten?: false, food_time?: false,
                                           stop_game: nil, collision?: false)

      engine.game_tick
      expect(mock_game).to have_received(:draw_snakes)
    end

    it 'draws board' do
      engine.game_tick
      expect(mock_game).to have_received(:draw_board)
    end

    it 'if game.player_eats is true, then call eat_and_grow' do
      allow(mock_game).to receive(:player_has_eaten?).and_return(true)
      engine.game_tick
      expect(mock_game).to have_received(:eat_and_grow)
    end

    it 'if game.player_eats if false, then do not call eat_and_grow' do
      allow(mock_game).to receive(:player_has_eaten?).and_return(false)
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
      allow(mock_game).to receive(:collision?).and_return(true)
      engine.game_tick
      expect(mock_game).to have_received(:stop_game)
    end

    it 'if no collsion, then stop_game is not called' do
      allow(mock_game).to receive(:collision?).and_return(false)
      engine.game_tick
      expect(mock_game).not_to have_received(:stop_game)
    end
  end

  describe '#register_keystroke' do
    subject(:engine) { described_class.new(window_adapter: mock_window) }

    include_context 'with a window mock'

    before do
      RacingSnakes.configuration = RacingSnakes::Configuration.new
      allow(RacingSnakes::Game).to receive(:new).and_return(mock_game)
      engine.instance_variable_set(:@game, mock_game)
      engine.instance_variable_set(:@game, mock_game)
      allow(mock_window).to receive(:close)
    end

    it 'closes the window when escape key is hit' do
      allow(mock_window).to receive(:on).with(:key_down).and_yield(OpenStruct.new(key: RacingSnakes::Keyboard::ESCAPE))
      engine.register_keystroke
      expect(mock_window).to have_received(:close)
    end

    it 'does not close the window if escape is not hit' do
      allow(mock_window).to receive(:on).with(:key_down).and_yield(OpenStruct.new(key: RacingSnakes::Keyboard::LEFT))

      engine.register_keystroke
      expect(mock_window).not_to have_received(:close)
    end

    it 'passes the keystroke to the game method' do
      allow(mock_window).to receive(:on).with(:key_down).and_yield(OpenStruct.new(key: RacingSnakes::Keyboard::LEFT))
      engine.register_keystroke
      expect(mock_game).to have_received(:keydown).with(RacingSnakes::Keyboard::LEFT)
    end
  end
end
