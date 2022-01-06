require_relative '../classes/game'
require_relative '../classes/author'
require 'date'

describe Game do
  before :each do
    @game1 = Game.new(Time.now, Time.now)
    @game2 = Game.new(Date.parse('1989/01/01'), Date.parse('1987/01/01'))
    @author = Author.new('Steven', 'Gerrard')
    @author.add_item(@game1)
    @author.add_item(@game2)
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

    it 'Should have author' do
      expect(@game1.author).to eq @author
    end

    it 'Should have author with Two items' do
      expect(@game1.author.items.size).to eq 2
    end

    it 'should return false for can be archived' do
      expect(@game1.can_be_archived?).to eq false
    end

    it 'should return true for can be archived' do
      expect(@game2.can_be_archived?).to eq true
    end
  end
end
