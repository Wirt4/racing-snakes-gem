# frozen_string_literal: true

module RacingSnakes
  # Game object for racing snakes, holds and maintains state
  class Game
    attr_reader :clock

    def initialize
      @clock = RacingSnakes::Clock.new
      @snake_1 = RacingSnakes::Snake.new(RacingSnakes::PlayerIds::PLAYER_ONE)
      @snake_2 = RacingSnakes::Snake.new(RacingSnakes::PlayerIds::PLAYER_TWO)
    end

    def move; end
    def keydown(keyname); end
    def draw_snakes; end
    def paused?; end
    def draw_board; end
    def player_eats?; end
    def eat_and_grow; end
    def food_time?; end
    def respawn_food; end
    def is_collision?; end
    def stop_game; end
  end
end
