module RacingSnakes
  class Engine
    attr_reader :game
    def initialize(window_adapter: nil)
      @game = RacingSnakes::Game.new
    end
    def start_game_loop
      puts "stub"
    end
  end
end
