# frozen_string_literal: true

require_relative '../lib/racing_snakes_gem/food'
require_relative '../lib/racing_snakes_gem/settings'

RSpec.describe Food do
  describe '#initialize' do
    it "food's y coordinate should be one-third down the board" do
      stub_const('Settings::GRID_WIDTH', 10)
      stub_const('Settings::GRID_HEIGHT', 30)
      food = Food.new
      expect(food.location).to eq(Coordinates.new(5, 10))
    end
  end
  describe '#respawn_food' do
    subject(:food) { described_class.new }
    let(:occupied_positions) { [[2, 3], [4, 5], [6, 7]] }
    let(:rng) { instance_double('Random') }

    it 'places food not in occupied positions on first try' do
      allow(rng).to receive(:rand).with(Settings::GRID_WIDTH).and_return(8)
      allow(rng).to receive(:rand).with(Settings::GRID_HEIGHT).and_return(9)

      food.respawn(occupied_positions, rng)

      expect(food.location).to eq(Coordinates.new(8, 9))
    end

    it 'retries until it finds an unoccupied position' do
      # First three attempts are occupied, fourth is not
      allow(rng).to receive(:rand).and_return(2, 3, 4, 5, 6, 7, 8, 9)

      food.respawn(occupied_positions, rng)
      expect(food.location).to eq(Coordinates.new(8, 9))
    end
  end
end
