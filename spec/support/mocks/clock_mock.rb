# frozen_string_literal: true

RSpec.shared_context 'with a clock mock' do
  let(:mock_clock) { instance_double(RacingSnakes::Clock, tick: nil) }
end
