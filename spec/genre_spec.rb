require_relative '../classes/genre'
require_relative '../classes/item'

describe Genre do
  context 'Genre class Test' do
    name = 'Rhythm and Blues'
    genre = Genre.new(name)

    it 'has name equal to "Rhythm and Blues"' do
      expect(genre.name).to eq('Rhythm and Blues')
    end

    item = Item.new('2021/02/02')
    genre.add_item(item)

    it 'should have 1 item after calling add_item' do
      expect(genre.items.size).to eq(1)
      expect(genre.items[0]).to eq(item)
    end

    genre.add_item(item)

    it 'should still have 1 item after calling add_item with the same item' do
      expect(genre.items.size).to eq(1)
      expect(genre.items[0]).to eq(item)
    end

    it 'item should have it as genre' do
      expect(item.genre).to eq(genre)
    end
  end
end
