require './classes/label'
require './classes/item'

describe Label do
  context 'Label class tests' do
    before(:each) do
      @label = Label.new('Label 1', 'White')
      @item = Item.new('2022/1/5')
    end

    it 'should return correct label title' do
      expect(@label.title).to eq 'Label 1'
    end

    it 'should return correct label color' do
      expect(@label.color).to eq 'White'
    end

    it 'should be a Label class instance' do
      expect(@label).to be_an_instance_of Label
    end

    it 'should return an array' do
      expect(@label.items).to eq []
    end

    it 'should add an item' do
      @label.add_item(@item)
      expect(@label.items.size).to eq(1)
      expect(@label.items[0]).to eq(@item)
    end
  end
end
