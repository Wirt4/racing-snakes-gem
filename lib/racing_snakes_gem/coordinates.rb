# frozen_string_literal: true

class Coordinates
  attr_reader :x, :y

  def initialize(x = 0, y = 0)
    @x = x
    @y = y
  end
end
