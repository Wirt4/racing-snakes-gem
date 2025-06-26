# frozen_string_literal: true

module RacingSnakes
  class Snake
    attr_accessor :position

    def initialize(button_mapping)
      unless button_mapping.is_a?(RacingSnakes::Button)
        raise ArgumentError, "Expected argument to be a Button, got #{button_mapping.class}"
      end

      @position = []
      @z_index = 0
    end

    def direction
      RacingSnakes::Directions::UP
    end

    def detect_key(keyname); end
    def draw; end
    def move; end
  end
end
