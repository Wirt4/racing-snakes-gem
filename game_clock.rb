class GameClock
  def initialize(startTime=0)
    @tick = startTime
  end

  def increment
    @tick +=1
  end

  attr_reader :tick

  def reset
    @tick =0
  end

  def is_food_time
    @tick > random_cutoff_mark
  end

  def random_cutoff_mark
    rand_wrapper(300..400)
  end

  def rand_wrapper(range)
    rand(range)
  end
end
