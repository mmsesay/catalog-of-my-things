require_relative './item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :name
  attr_reader :items

  def initialize(on_spotify, name, publish_date)
    super(publish_date)
    @id = Random.rand(1..1000)
    @on_spotify = on_spotify
    @name = name
    @items = []
  end

  def can_be_archived?
    super && @on_spotify
  end
end
