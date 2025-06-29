# frozen_string_literal: true

require_relative 'keyboard_buttons'

class Button
  attr_accessor :up, :down, :left, :right

  def initialize(player_id)
    if player_id == PlayerIds::PLAYER_ONE
      @left = Keyboard::LEFT
      @right = Keyboard::RIGHT
      @up = Keyboard::UP
      @down = Keyboard::DOWN
      return
    end

    @left = Keyboard::A
    @right = Keyboard::D
    @up = Keyboard::W
    @down = Keyboard::S
  end
end
