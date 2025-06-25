# frozen_string_literal: true

module RacingSnakes
  class Clock
    attr_reader :time
    def initialize
      @time = 0
    end
    def tick; end
    def reset; end
    def food_time?; end
  end
end
