# frozen_string_literal: true

module RacingSnakes
  attr_reader :snake1, :snake2

  class Board
    def initialize(snake1, snake2)
      @snake1 = snake1
      @snake2 = snake2
    end
    def respawn_food(occupied_coordinates) end
    def menu?; end
    def finished?; end
    def tie?(snake1, snake2); end
    def has_eaten_food?(snake); end
    def draw; end
  end
end
