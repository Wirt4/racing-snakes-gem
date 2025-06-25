# frozen_string_literal: true

RSpec.shared_context 'with a window mock' do
  let(:mock_window) { instance_double(Ruby2D::Window, set: nil, clear: nil) }
end
