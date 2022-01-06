require_relative '../classes/author'

describe Author do
  before :each do
    @author1 = Author.new('John', 'Doe')
  end

  describe 'Instance Test' do
    it 'Should have proper class instance' do
      expect(@author1).to be_an_instance_of Author
    end

    it 'Should have an empty items at first' do
      expect(@author1.items.length).to eq 0
    end

    it 'Should return correct full name' do
      full_name = "#{@author1.first_name} #{@author1.last_name}"
      expect(full_name).to eq 'John Doe'
    end
  end
end
