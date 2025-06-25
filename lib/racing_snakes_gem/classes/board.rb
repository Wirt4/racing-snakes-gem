# frozen_string_literal: true

module RacingSnakes
  attr_reader :snake1, :snake2
  class Board
    def initialize(snake1, snake2)
      @snake1 = snake1
      @snake2 = snake2
    end
  end
end
