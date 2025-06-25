# frozen_string_literal: true

module RacingSnakes
  # Game object for racing snakes, holds and maintains state
  class Game
    attr_reader :clock, :player1, :player2, :board

    def initialize
      @clock = RacingSnakes::Clock.new
      @player1 = RacingSnakes::Snake.new(RacingSnakes::PlayerIds::PLAYER_ONE)
      @player2 = RacingSnakes::Snake.new(RacingSnakes::PlayerIds::PLAYER_TWO)
      @board = RacingSnakes::Board.new(@player1, @player2)
    end

    def move; end

    def keydown(keyname); end

    def draw_snakes
      @player1.draw
      @player2.draw
    end

    def paused?; end

    def draw_board
      draw_snakes
      @board.draw
      @player1eats = @board.has_eaten_food?(@player1)
      @player2eats = @board.has_eaten_food?(@player2)
    end

    def player_eats?; end
    def eat_and_grow; end
    def food_time?; end
    def respawn_food; end
    def is_collision?; end
    def stop_game; end
  end
end
