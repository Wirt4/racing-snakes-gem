# frozen_string_literal: true

require 'racing_snakes_gem'
RSpec.describe RacingSnakes::Game do
  describe '#initialize' do
    subject(:game) { described_class.new }

    include_context 'with a clock mock'
    include_context 'with a snake mock'
    include_context 'with a board mock'
    before do
      allow(RacingSnakes::Clock).to receive(:new).and_return(mock_clock)
      allow(RacingSnakes::Board).to receive(:new).and_return(mock_board)
      allow(RacingSnakes::Snake).to receive(:new).and_return(mock_snake)
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

    it 'intializes a board' do
      game
      expect(game.board).to eq(mock_board)
    end
  end

  describe '#draw_snakse' do
    subject(:game) { described_class.new }

    include_context 'with a snake mock'
    it 'calls draw on both snakes' do
      game
      allow(game.player1).to receive(:draw)
      allow(game.player2).to receive(:draw)

      game.draw_snakes

      expect(game.player1).to have_received(:draw)
      expect(game.player2).to have_received(:draw)
    end
  end

  describe '#draw_board' do
    subject(:game) { described_class.new }

    it 'drawing the board should draw the snakes' do
      game
      allow(game).to receive(:draw_snakes)

      game.draw_board

      expect(game).to have_received(:draw_snakes)
    end

    it 'drawing the board should call board.draw' do
      game
      allow(game.board).to receive(:draw)
      game.draw_board
      expect(game.board).to have_received(:draw)
    end

    it 'drawing the board checks if the snakes have eaten food' do
      game
      allow(game).to receive(:draw_snakes)
      allow(game.board).to receive(:draw)
      board_args = []
      allow(game.board).to receive(:has_eaten_food?) do |*args|
        board_args << args
        double(game.board)
      end
      game.draw_board

      expect(board_args).to eq([[game.player1], [game.player2]])
    end
    it 'given that neither of the players have eaten, when game.draw_board is called, then both has_eaten variables will be false'do 
      game
      allow(game).to receive(:draw_snakes)
      allow(game.board).to receive(:draw)
      allow(game.board).to receive(:has_eaten_food?).and_return(false, false)
      game.draw_board

      expect(game.player1_has_eaten).to be(false)
      expect(game.player2_has_eaten).to be(false)

    end
  end
end
