class Food
  attr_reader :x, :y, :color

  def initialize
    @x = Settings::GRID_WIDTH / 2
    @y = Settings::GRID_HEIGHT / 3
    @color = Settings::FOOD_COLOR
  end

  def respawn(pos, rng = Kernel)
    @x = rng.rand(Settings::GRID_WIDTH)
    @y = rng.rand(Settings::GRID_HEIGHT)
    while pos.include?([@x, @y])
      @x = rng.rand(Settings::GRID_WIDTH)
      @y = rng.rand(Settings::GRID_HEIGHT)
    end
  end
end
