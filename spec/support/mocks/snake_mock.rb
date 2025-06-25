# frozen_string_literal: true

RSpec.shared_context 'with a snake mock' do
  let(:mock_snake) { instance_double(RacingSnakes::Snake, move:nil, draw: nil) }
end
