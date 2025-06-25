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
    attr_accessor :background, :width, :height, :fps_cap, :fullscreen

    def initialize
      @background = 'black'
      @width      = 640
      @height     = 480
      @fps_cap    = 60
      @fullscreen = false
    end
  end
end

