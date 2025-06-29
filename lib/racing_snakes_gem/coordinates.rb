# frozen_string_literal: true

class Coordinates
  attr_reader :x, :y

  def initialize(x = 0, y = 0)
    @x = x
    @y = y
  end

  def ==(other)
    other.is_a?(Coordinates) && @x == other.x && @y == other.y
  end
end
