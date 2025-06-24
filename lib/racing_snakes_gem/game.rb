# frozen_string_literal: true

module RacingSnakes
  # Game object for racing snakes, holds and maintains state
  class Game
    def move; end
    def handle_key(keyname); end
    def draw_snakes; end
    def paused?;end
    def draw_board;end
    def player_eats?;end
    def eat_and_grow; end
    def food_time?;end
    def respawn_food; end
    def is_collision?;end
    def stop_game;end
  end
end
