# require_relative './item'

class Genre
  attr_accessor :name
  attr_reader :items

  def initialize(name)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(new_item)
    @items.push(new_item) unless @items.include?(new_item)
    new_item.genre = self
  end
end
