# frozen_string_literal: true

# rubocop:disable RSpec/ContextWording
RSpec.shared_context 'window mock' do
  let(:mock_window) { instance_double(Ruby2D::Window, set: nil, clear: nil) }
end
