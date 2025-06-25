# frozen_string_literal: true

RSpec.shared_context 'with a board mock' do
  let(:mock_board) { instance_double(RacingSnakes::Board, tie?: nil, finished?: false, has_eaten_food?: false, collision?: false) }
end
