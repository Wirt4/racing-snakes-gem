module RacingSnakes
  module CLI
    def self.run
      require 'ruby2d' # runtime loading
      engine = RacingSnakes::Engine.new(Ruby2D::Window)
      engine.start_game_loop
    end
  end
end

