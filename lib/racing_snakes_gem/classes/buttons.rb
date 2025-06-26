class Button
  attr_reader :up, :down, :left, :right
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

