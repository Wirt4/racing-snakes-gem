# frozen_string_literal: true

module RacingSnakes
  # Command Line Interface for running the gem: general entry point to the game
  module CLI
    def self.run
      require 'ruby2d' # runtime loading
      engine = RacingSnakes::Engine.new(Ruby2D::Window)
      engine.start_game_loop
    end
  end
end
