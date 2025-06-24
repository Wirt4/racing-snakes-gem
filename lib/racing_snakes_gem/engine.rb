
module RacingSnakes
  class Engine
    attr_reader :game
    def initialize(window_adapter: nil)
      # override dependency injection for production
      window_adapter ||= Ruby2D::Window
      config = RacingSnakes.configuration

      window_adapter.set(background: config.background)
      window_adapter.set(width: config.width)
      window_adapter.set(height: config.height)
      window_adapter.set(fps_cap: config.fps_cap)

      window_adapter.set(fullscreen: false)
      @game = RacingSnakes::Game.new
      @game.draw_snakes
    end
    def start_game_loop
      update do
        game_tick
      end
    end
    def game_tick
      puts "stub"
    end
  end
end
