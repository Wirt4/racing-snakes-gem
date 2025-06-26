# frozen_string_literal: true

module RacingSnakes
  class Clock
    attr_reader :time

    def initialize(time=0, randomizer=-> { rand(300..400) })
      @randomizer = randomizer
      @time = time
      @cutoff = randomizer.call
    end

    def tick
      @time += 1
    end

    def reset
      @time = 0
    end

    def food_time?
      return false if @time <= @cutoff

      @cutoff = @randomizer.call
      true
    end
  end
end
