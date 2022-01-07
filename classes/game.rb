require_relative './item'
class Game < Item
  def initialize(name, publish_date, last_played_at, multiplayer = false)
    super(publish_date)
    @name = name
    @last_played_at = last_played_at
    @multiplayer = multiplayer
  end

  attr_accessor :last_played_at, :author, :multiplayer, :name, :publish_date

  def add_author(author)
    !author.items.include?(self) && author.add_item(self)
  end

  def can_be_archived?
    bool = super
    now_year = Time.new.year
    year_last_played = @last_played_at.year
    archive = now_year - year_last_played
    archive && bool
  end
end
