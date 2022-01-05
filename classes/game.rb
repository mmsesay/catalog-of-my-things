require_relative './item'
class Game < Item
  def initialize(publish_date, last_played_at, multiplayer: false)
    super(publish_date)
    @last_played_at = last_played_at
    @multiplayer = multiplayer
  end

  attr_accessor :last_played_at, :author, :multiplayer

  def add_author(author)
    !author.items.include?(self) && author.add_item(self)
  end
end
