RSpec.describe RacingSnakes::Snake do
  
  describe '#initialize' do
    subject(:snake) { described_class.new(RacingSnakes::PlayerIds::PLAYER_ONE) }
    it 'direction is initialized as up' do
      expect(snake.direction).to eq(RacingSnakes::Directions::UP)
    end
  end
end

