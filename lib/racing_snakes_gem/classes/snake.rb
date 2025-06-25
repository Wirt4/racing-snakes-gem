# frozen_string_literal: true

module RacingSnakes
  class Snake
    attr_accessor :position

    def initialize(_snake_id)
      @position = []
      @z_index = 0
    end
    def detect_key(keyname); end
    def draw; end
    def move; end
  end
end
