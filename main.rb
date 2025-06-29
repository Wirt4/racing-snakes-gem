require 'ruby2d'
require_relative 'lib/racing_snakes_gem/board'
require_relative 'lib/racing_snakes_gem/game'
require_relative 'lib/racing_snakes_gem/game_clock'
require_relative 'lib/racing_snakes_gem/settings'
require_relative 'lib/racing_snakes_gem/snake'
require_relative 'lib/racing_snakes_gem/keyboard_buttons'

set background: Settings::BACKGROUND
set width: Settings::WIDTH
set height: Settings::HEIGHT
set fps_cap: Settings::FPS
set fullscreen: Settings::FULLSCREEN

game = Game.new
game.draw_snakes

# the game cycle
update do
  clear

  game.move unless game.is_paused?

  game.draw_board

  game.eat_and_grow if game.player_eats

  game.respawn_food if game.food_time?

  # prints out the winner of the game if it ends
  game.stop_game if game.is_collision?
end

# player controls, is up, down, left, right /AWSD
on :key_down do |event|
  k = event.key
  game.detect_key(k)
  close if event.key == Keyboard::ESCAPE
end
show
