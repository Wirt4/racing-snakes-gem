# frozen_string_literal: true

require 'rspec'
require_relative '../lib/racing_snakes_gem/coordinates'

RSpec.describe Coordinates do
  describe '#initialize' do
    it 'default x coord is 0' do
      coords = Coordinates.new
      expect(coords.x).to eq(0)
    end
    it 'default y coord is 0' do
      coords = Coordinates.new
      expect(coords.y).to eq(0)
    end
    it 'x is set as parameter 1 in constructor' do
      coords = Coordinates.new(3)
      expect(coords.x).to eq(3)
    end
    it 'y is set as parameter 1 in constructor' do
      coords = Coordinates.new(3, 4)
      expect(coords.y).to eq(4)
    end
  end
end
