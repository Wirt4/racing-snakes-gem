# frozen_string_literal: true

module RacingSnakes
  class Button
    attr_reader :up, :down, :left, :right

    def ==(other)
      return false unless other.is_a?(Button)

      up == other.up && down == other.down && left == other.left && right == other.right
    end
  end

  class PlayerOneButton < Button
    def initialize
      @left = Keyboard::LEFT
      @right = Keyboard::RIGHT
      @up = Keyboard::UP
      @down = Keyboard::DOWN
    end
  end

  class PlayerTwoButton < Button
    def initialize
      @left = Keyboard::A
      @right = Keyboard::D
      @up = Keyboard::W
      @down = Keyboard::S
    end
  end
end
