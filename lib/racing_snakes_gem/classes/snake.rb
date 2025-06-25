# frozen_string_literal: true

module RacingSnakes
  class Snake
    attr_accessor :position

    def initialize(_snake_id)
      @position = []
    end

    def draw; end
    def move; end
  end
end
