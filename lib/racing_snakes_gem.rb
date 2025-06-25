# frozen_string_literal: true

require_relative 'racing_snakes_gem/version'
require_relative 'racing_snakes_gem/classes/cli'
require_relative 'racing_snakes_gem/classes/engine'
require_relative 'racing_snakes_gem/classes/game'
require_relative 'racing_snakes_gem/classes/clock'
require_relative 'racing_snakes_gem/modules/keyboard'
require_relative 'racing_snakes_gem/classes/snake'
require_relative 'racing_snakes_gem/modules/player_ids'
require_relative 'racing_snakes_gem/classes/board'
require_relative 'racing_snakes_gem/classes/coordinates'
# Gem for the racing snakes game
module RacingSnakes
  class Error < StandardError; end
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :background, :width, :height, :fps_cap, :fullscreen,
                  :winner_message_x_coordinate, :winner_message_y_coordinate,
                  :square_size, :text_color, :food_color, :winner_message_z_index,
                  :grid_size, :grid_width, :grid_height, :node_size,
                  :player_one_colors, :player_two_colors, :start_y_tail,
                  :start_length, :press_space, :tie_message, :winner_message

    def initialize
      @background = 'black'
      @width      = 1920
      @height     = 1080
      @fps_cap    = 20
      @fullscreen = true
      @width = 1920
      @square_size = 30
      @text_color = 'white'
      @food_color = 'text_color'
      @winner_message_x_coordinate = 70
      @winner_message_y_coordinate = 350
      @winner_message_z_index = 5
      @grid_size = @square_size
      @grid_width = @width / @grid_size
      @grid_height = @height / @grid_size
      @node_size = @grid_size
      @player_one_colors = %w[yellow orange red].freeze
      @player_two_colors = %w[fuchsia blue green].freeze
      @start_y_tail = 3
      @start_length = 3
      @press_space = '(press space)'
      @tie_message = 'Tie'
      @winner_message = ' Wins'
    end
  end
end

