# require './classes/item'

class Book # < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state)
    super()
    @publisher = publisher
    @cover_state = cover_state

    @parent_is_archived = can_be_archived?
  end

  def can_be_archived?
    @parent_is_archived || cover_state == 'bad'
  end
end
