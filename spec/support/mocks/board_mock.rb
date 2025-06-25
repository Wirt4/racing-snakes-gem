# frozen_string_literal: true

RSpec.shared_context 'board mock' do
  let(:mock_board) { instance_double(RacingSnakes::Board) }
end
