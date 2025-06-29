# frozen_string_literal: true

class Food
  attr_reader :location, :color

  def initialize
    @location = Coordinates.new(Settings::GRID_WIDTH / 2, Settings::GRID_HEIGHT / 3)
    @color = Settings::FOOD_COLOR
  end

  def respawn(pos, rng = Kernel)
    randomize_location(rng)
    randomize_location(rng) while pos.include?([@location.x, @location.y])
  end

  def x
    @location.x
  end

  def y
    @location.y
  end

  private

  def randomize_location(rng)
    @location = Coordinates.new(rng.rand(Settings::GRID_WIDTH), rng.rand(Settings::GRID_HEIGHT))
  end
end
