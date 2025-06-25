# frozen_string_literal: true

module RacingSnakes
  class Clock
    attr_reader :time

    def initialize(time=0)
      @time = time
    end

    def tick
      @time += 1
    end

    def reset
      @time = 0
    end

    def food_time?; end
  end
end
