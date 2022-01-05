class Author
  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    if item.author || @items.include?(item)
      nil
    else
      item.author = self
      @items << item
    end
  end
end
