
module RacingSnakes
  class Engine
    attr_reader :game
    attr_reader :window
    def initialize(window_adapter: nil)
      # override dependency injection for production
      config = RacingSnakes.configuration

      window_adapter ||= Ruby2D::Window
      @window = window_adapter
      @window.set(background: config.background)
      @window.set(width: config.width)
      @window.set(height: config.height)
      @window.set(fps_cap: config.fps_cap)
      @window.set(fullscreen: false)

      @game = RacingSnakes::Game.new
      @game.draw_snakes
    end
    def start_game_loop
      update do
        game_tick
      end
    end
    def game_tick
      @window.clear
      game.move
    end
  end
end
