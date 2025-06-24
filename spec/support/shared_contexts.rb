# frozen_string_literal: true

# spec/support/shared_contexts.rb
RSpec.shared_context 'window mock' do
  let(:mock_window) { instance_double(Ruby2D::Window, set: nil, clear: nil) }
end

RSpec.shared_context 'game mock' do
  let(:mock_game) do
    instance_double(
      RacingSnakes::Game,
      move: nil,
      draw_snakes: nil,
      paused?: false,
      draw_board: nil,
      player_eats?: false,
      eat_and_grow: nil,
      food_time?: false,
      respawn_food: nil,
      is_collision?: false,
      stop_game: nil
    )
  end
end
