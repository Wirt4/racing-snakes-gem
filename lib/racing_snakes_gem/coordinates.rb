# frozen_string_literal: true

# Coordinates class represents a point in a 2D space with x and y coordinates.
# a little DRY
class Coordinates
  attr_reader :x, :y

  def initialize(x_coord = 0, y_coord = 0)
    @x = x_coord
    @y = y_coord
  end

  def ==(other)
    other.is_a?(Coordinates) && @x == other.x && @y == other.y
  end
end
