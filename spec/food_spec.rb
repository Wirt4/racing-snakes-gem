require_relative '../lib/racing_snakes_gem/food'
require_relative '../lib/racing_snakes_gem/settings'

RSpec.describe Food do
  describe '#initialize' do
    it "food's x coordinate should be halfway across the board" do
      stub_const('Settings::GRID_WIDTH', 10)
      food = Food.new
      expect(food.x).to eq(5)
    end

    it "food's y coordinate should be one-third down the board" do
      stub_const('Settings::GRID_HEIGHT', 30)
      food = Food.new
      expect(food.y).to eq(10)
    end
  end
end
