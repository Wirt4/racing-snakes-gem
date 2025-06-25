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

    it 'given that neither of the players have eaten' do
      game
      allow(game).to receive(:draw_snakes)
      allow(game.board).to receive(:draw)
      allow(game.board).to receive(:has_eaten_food?).and_return(false, false)
      game.draw_board

      expect(game.player1_has_eaten).to be(false)
      expect(game.player2_has_eaten).to be(false)
    end

    it 'player 1 has eaten' do
      game
      allow(game).to receive(:draw_snakes)
      allow(game.board).to receive(:draw)
      allow(game.board).to receive(:has_eaten_food?).and_return(true, false)
      game.draw_board

      expect(game.player1_has_eaten).to be(true)
      expect(game.player2_has_eaten).to be(false)
    end
  end

  describe '#paused?' do
    subject(:game) { described_class.new }

    include_context 'with a board mock'
    before do
      allow(RacingSnakes::Board).to receive(:new).and_return(mock_board)
    end

    it 'board is in neither in menu mode nor finished' do
      game
      allow(game.board).to receive_messages(finished?: false,
                                            menu?: false)
      expect(game.paused?).to be(false)
    end

    it 'board is in menu mode' do
      game
      allow(game.board).to receive_messages(menu?: true, finished?: false)
      expect(game.paused?).to be(true)
    end

    it 'board is finished' do
      game
      allow(game.board).to receive_messages(menu?: false, finished?: true)
      expect(game.paused?).to be(true)
    end
  end

  describe '#move' do
    subject(:game) { described_class.new }

    include_context 'with a board mock'
    include_context 'with a clock mock'

    before do
      allow(RacingSnakes::Board).to receive(:new).and_return(mock_board)
      allow(RacingSnakes::Clock).to receive(:new).and_return(mock_clock)
      allow(mock_clock).to receive(:tick)
    end

    it 'checks for a tie condition' do
      game
      allow(game.board).to receive(:tie?)

      game.move

      expect(game.board).to have_received(:tie?).with(game.player1, game.player2)
    end

    it 'moves the players' do
      game
      allow(game.player1).to receive(:move)
      allow(game.player2).to receive(:move)

      game.move

      expect(game.player1).to have_received(:move)
      expect(game.player2).to have_received(:move)
    end

    it 'increments the clock' do
      game
      game.move
      expect(mock_clock).to have_received(:tick)
    end
  end

  describe '#player_has_eaten?' do
    subject(:game) { described_class.new }

    it 'neither player has eaten anything' do
      game
      allow(game).to receive_messages(player1_has_eaten: false, player2_has_eaten: false)
      expect(game.player_has_eaten?).to be(false)
    end

    it 'player one has eaten' do
      game
      allow(game).to receive_messages(player1_has_eaten: true, player2_has_eaten: false)
      expect(game.player_has_eaten?).to be(true)
    end

    it 'player two has eaten' do
      game
      allow(game).to receive_messages(player1_has_eaten: false, player2_has_eaten: true)
      expect(game.player_has_eaten?).to be(true)
    end
  end

  describe '#eat_and_grow' do
    subject(:game) { described_class.new }

    it 'player1 has eaten' do
      game
      allow(game).to receive(:player1_has_eaten).and_return(true)
      allow(game.player1).to receive(:grow)

      game.eat_and_grow

      expect(game.player1).to have_received(:grow)
    end

    it 'player1 has not eaten' do
      game
      allow(game).to receive(:player1_has_eaten).and_return(false)
      allow(game.player1).to receive(:grow)

      game.eat_and_grow

      expect(game.player1).not_to have_received(:grow)
    end

    it 'player2 has eaten' do
      game
      allow(game).to receive(:player2_has_eaten).and_return(true)
      allow(game.player2).to receive(:grow)

      game.eat_and_grow

      expect(game.player2).to have_received(:grow)
    end

    it 'player2 has not eaten' do
      game
      allow(game).to receive(:player2_has_eaten).and_return(false)
      allow(game.player2).to receive(:grow)

      game.eat_and_grow

      expect(game.player2).not_to have_received(:grow)
    end

    it 'respawns food on game board' do
      game
      allow(game).to receive(:respawn_food)

      game.eat_and_grow

      expect(game).to have_received(:respawn_food)
    end
  end
  describe '#respawn_food'do 
     subject(:game) { described_class.new }
     it 'position 1' do 
      game
      allow(game.board).to receive(:respawn_food)

      game.player1.position = [[-1, 0], [-1, -1], [-1, -2]]
      game.player2.position = [[1, 0], [1, -1], [1, -2]]
      expected = [[-1, 0], [-1, -1], [-1, -2], [1, 0], [1, -1], [1, -2]]

      game.respawn_food

      expect(game.board).to have_received(:respawn_food).with(expected)

     end
     it 'position 2' do 
       game
      allow(game.board).to receive(:respawn_food)
      game.player1.position = [[0, 0], [0, -1], [0, -2]]
      game.player2.position = [[1, 0], [1, -1], [1, -2]]
      expected = [[0, 0], [0, -1], [0, -2], [1, 0], [1, -1], [1, -2]]

      game.respawn_food

      expect(game.board).to have_received(:respawn_food).with(expected)

     end


  end
end
