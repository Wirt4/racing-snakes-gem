# frozen_string_literal: true

module RacingSnakes
  # Game object for racing snakes, holds and maintains state
  class Game
    attr_reader :clock, :player1, :player2, :board, :player1_has_eaten, :player2_has_eaten

    def initialize
      @clock = RacingSnakes::Clock.new
      @player1 = RacingSnakes::Snake.new(RacingSnakes::PlayerIds::PLAYER_ONE)
      @player2 = RacingSnakes::Snake.new(RacingSnakes::PlayerIds::PLAYER_TWO)
      @board = RacingSnakes::Board.new(@player1, @player2)
    end

    def move
      @board.tie?(@player1, @player2)
      @player1.move
      @player2.move
      @clock.tick
    end

    def keydown(keyname); end

    def draw_snakes
      @player1.draw
      @player2.draw
    end

    def paused?
      @board.menu? || @board.finished?
    end

    def draw_board
      draw_snakes
      @board.draw
      @player1_has_eaten = @board.has_eaten_food?(@player1)
      @player2_has_eaten = @board.has_eaten_food?(@player2)
    end

    def player_has_eaten?
      player1_has_eaten || player2_has_eaten
    end

    def eat_and_grow
      player1.grow if player1_has_eaten
      player2.grow if player2_has_eaten
      respawn_food
    end

    def food_time?
      clock.food_time?
    end

    def respawn_food
      board.respawn_food(player1.position + player2.position)
      clock.reset
    end

    def collision?
      @board.collision?(@player1.position, @player2.position)
    end

    def stop_game
      @board.finish
      @board.display_message('player 1', 'bar','fuzz')
    end
  end
end
