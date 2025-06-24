# frozen_string_literal: true

require_relative "racing_snakes_gem/version"
require_relative "racing_snakes_gem/cli"
require_relative "racing_snakes_gem/engine"
require_relative "racing_snakes_gem/game"
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
      @background = "black"
      @width      = 640
      @height     = 480
      @fps_cap    = 60
      @fullscreen = false
    end
  end
end

