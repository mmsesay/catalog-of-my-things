# require_relative './item'

class Label
  attr_accessor :title, :color
  attr_reader :items, :item_class_instance

  def initialize(title, color)
    @id = Random.rand(1..1000)
    @title = title
    @color = color
    @items = []
    @item_class_instance = Item.new('2022/4/1') # TODO: Request to set the constructor argument as default
  end

  def add_item(new_item)
    @item_class_instance = new_item
    new_item.items.push(self) unless new_item.items.include?(self)
  end
end
