require_relative './item'

class MusicAlbum < Item
  attr_accessor :on_spotify
  attr_reader :items

  def initialize(on_spotify, publish_date)
    super(publish_date)
    @id = Random.rand(1..1000)
    @on_spotify = on_spotify
    @items = []
  end

  def can_be_archived?
    super && @on_spotify
  end
end
