# frozen_string_literal: true

module RacingSnakes

# Game engine for racing snakes, runs the primary loop
  class Engine
    attr_reader :game, :window
    def initialize(window_adapter: nil)
      init_window(window_adapter)
      @game = RacingSnakes::Game.new
      @game.draw_snakes
    end

    def start_game_loop
      update do
        game_tick
      end
    end
    
    def game_tick
      window.clear
      game.move unless game.paused?
      game.draw_snakes
    end

    private

    def init_window(window_adapter)
      config = RacingSnakes.configuration

      window_adapter ||= Ruby2D::Window
      @window = window_adapter
      @window.set(background: config.background)
      @window.set(width: config.width)
      @window.set(height: config.height)
      @window.set(fps_cap: config.fps_cap)
      @window.set(fullscreen: false)
    end
  end
end
