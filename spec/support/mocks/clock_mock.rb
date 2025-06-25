# frozen_string_literal: true

RSpec.shared_context 'clock mock' do
  let(:mock_clock) { instance_double(RacingSnakes::Clock) }
end
