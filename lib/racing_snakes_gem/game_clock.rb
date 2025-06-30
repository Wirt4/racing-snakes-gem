# frozen_string_literal: true

# GameClock class to manage the game time and food spawning logic.
class GameClock
  def initialize(start_time = 0)
    @tick = start_time
  end

  def increment
    @tick += 1
  end

  attr_reader :tick

  def reset
    @tick = 0
  end

  def food_time?
    @tick > random_cutoff_mark
  end

  def random_cutoff_mark
    rand_wrapper(300..400)
  end

  def rand_wrapper(range)
    rand(range)
  end
end
