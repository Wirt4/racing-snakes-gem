module RacingSnakes
  module CLI
    def self.run
      engine = RacingSnakes::Engine.new
      engine.start_game_loop
    end
  end
end

