class Food
  attr_reader :x, :y, :color

  def initialize
    @x = Settings::GRID_WIDTH / 2
    @y = Settings::GRID_HEIGHT / 3
    @color = Settings::FOOD_COLOR
  end

  def respawn_food(pos, rng: Kernel)
    @food_x = rng.rand(Settings::GRID_WIDTH)
    @food_y = rng.rand(Settings::GRID_HEIGHT)
    while pos.include?([@food_x, @food_y])
      @food_x = rng.rand(Settings::GRID_WIDTH)
      @food_y = rng.rand(Settings::GRID_HEIGHT)
    end
  end
end
