# frozen_string_literal: true

module RacingSnakes
  class Coordinates
    attr_reader :x_coord, :y_coord

    def initialize(x_coord=0, y_coord=0)
      @x_coord = x_coord
      @y_coord = y_coord
    end

    def eql?(other)
      self == other
    end

    def hash
      [x_coord, y_coord].hash
    end

    def ==(other)
      other.is_a?(Coordinates) && other.x_coord == x_coord && other.y_coord == y_coord
    end
  end
end
