# frozen_string_literal: true

require_relative 'player_ids'
require_relative 'keyboard_buttons'
# Button class to handle player input for movement
class Button
  attr_accessor :up, :down, :left, :right

  PLAYER_BINDINGS = {
    PlayerIds::PLAYER_ONE => {
      left: Keyboard::LEFT,
      right: Keyboard::RIGHT,
      up: Keyboard::UP,
      down: Keyboard::DOWN
    },
    PlayerIds::PLAYER_TWO => {
      left: Keyboard::A,
      right: Keyboard::D,
      up: Keyboard::W,
      down: Keyboard::S
    }
  }.freeze

  def initialize(player_id)
    bindings = PLAYER_BINDINGS[player_id]

    @left  = bindings[:left]
    @right = bindings[:right]
    @up    = bindings[:up]
    @down  = bindings[:down]
  end
end
