# frozen_string_literal: true

require_relative 'game_clock'
require_relative 'snake'
require_relative 'player_ids'

class Game
  attr_reader :player1, :player2, :board, :clock
  attr_accessor :player1Eats, :player2Eats

  def initialize
    @clock = GameClock.new
    @player1 = Snake.new(PlayerIds::PLAYER_ONE)
    @player2 = Snake.new(PlayerIds::PLAYER_TWO)
    @board = Board.new(@player1, @player2)
  end

  def draw_snakes
    @player1.draw
    @player2.draw
  end

  def get_player_one_color
    Settings::PLAYER_ONE_COLORS.sample
  end

  def get_player_two_color
    Settings::PLAYER_TWO_COLORS.sample
  end

  def draw_board
    draw_snakes
    @board.draw
    @player1Eats = @board.snake_eat_food?(@player1)
    @player2Eats = @board.snake_eat_food?(@player2)
  end

  def is_paused?
    board.finished? || board.menu?
  end

  def move
    @board.is_tie(@player1, @player2)
    @player1.move
    @player2.move
    @clock.increment
  end

  def player_eats
    @player1Eats || @player2Eats
  end

  def eat_and_grow
    @player1.grow if player1Eats
    @player2.grow if player2Eats

    respawn_food
  end

  def food_time?
    @clock.is_food_time
  end

  def respawn_food
    @clock.reset
    @board.respawn_food(@player1.position + @player2.position)
  end

  def is_collision?
    @board.collision?(@player1.position, @player2.position)
  end

  def stop_game
    @board.finish
    winner = @board.winner(@player1, @player2)

    @board.drop_shadow(winner, Coordinates.new(Settings::WINNER_MSG_X, Settings::WINNER_MSG_Y), Settings::TEXT_COLOR)
  end

  def detect_key(k)
    @player1.detect_key(k)
    @player2.detect_key(k)

    if board.finished? && k == Keyboard::SPACE
      @player1 = Snake.new(PlayerIds::PLAYER_ONE)
      @player2 = Snake.new(PlayerIds::PLAYER_TWO)
      @board = Board.new(@player1, @player2)
    end

    return unless k == Keyboard::SPACE

    pause
  end

  def pause
    @board.pause
  end
end
