# frozen_string_literal: true

RSpec.shared_context 'with a game mock' do
  let(:mock_game) do
    instance_double(
      RacingSnakes::Game,
      move: nil,
      draw_snakes: nil,
      paused?: false,
      keydown: nil,
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
