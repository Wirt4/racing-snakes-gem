# frozen_string_literal: true

module RacingSnakes
  class Snake
    attr_accessor :position, :z_index

    def initialize(_snake_id)
      @position = []
      @z_index = 0
    end

    def draw; end
    def move; end
    def z_index(z_index)
      @z_index = z_index
    end
  end
end
