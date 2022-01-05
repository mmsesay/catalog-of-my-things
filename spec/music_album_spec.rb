require 'date'
require_relative '../classes/music_album'

describe MusicAlbum do
  context 'MusicAlbum class Test' do
    on_spotify = true
    name = '29'
    publish_date = Date.parse('2022/01/01')
    album = MusicAlbum.new(on_spotify, name, publish_date)

    it 'is an instance of class item' do
      expect(album).to be_an_instance_of(MusicAlbum)
    end

    it 'has on_spotify as true' do
      expect(album.on_spotify).to eq(true)
    end

    it 'checks can_be_archived as false' do
      expect(album.can_be_archived?).to eq(false)
    end

    new_date = Date.parse('1989/01/01')
    new_name = 'Kamakaze'
    new_album = MusicAlbum.new(on_spotify, new_name, new_date)

    it 'checks can_be_archived as true' do
      expect(new_album.can_be_archived?).to eq(true)
    end
  end
end
