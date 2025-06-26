# frozen_string_literal: true

module RacingSnakes
  class Snake
    attr_accessor :position, :growing

    def initialize(button_mapping, colors)
      unless button_mapping.is_a?(RacingSnakes::Button)
        raise ArgumentError, "Expected argument to be a Button, got #{button_mapping.class}"
      end

      @color = colors.sample

      @position = []
      @z_index = 0
      @growing = false
    end

    def direction
      RacingSnakes::Directions::UP
    end

    def color_name
      @color.capitalize
    end

    def detect_key(keyname); end
    def draw; end
    def move; end
  end
end
