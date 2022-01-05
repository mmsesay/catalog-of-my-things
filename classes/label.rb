class Label
  attr_accessor :id, :title, :color
  attr_reader :items

  def initialize(title, color)
    @id = Random.rand(1..1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(new_item)
    @items << new_item
    new_item.label = self
  end
end
