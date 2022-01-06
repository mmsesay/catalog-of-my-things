require_relative '../classes/game'

describe Game do
  before :each do
    @game1 = Game.new('Conquer', Time.now, Time.now)
  end

  describe 'Instance Test' do
    it 'Should have proper class instance' do
      expect(@game1).to be_an_instance_of Game
    end

    it 'Should have false as the value of multiplayer property at first' do
      expect(@game1.multiplayer).to eq false
    end

    it 'Should be able to set multiplayer property to true' do
      @game1.multiplayer = true
      expect(@game1.multiplayer).to eq true
    end
  end
end
