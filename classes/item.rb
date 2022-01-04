class Item
  attr_accessor :publish_date
  attr_reader :id, :archived, :genre, :author, :label

  def initialize(publish_date)
    @id = Random.rand(1..1000)
    @genre = nil
    @author = nil
    @label = nil
    @publish_date = publish_date
    @archived = false
  end

  def genre=(new_genre)
    @genre = new_genre
    new_genre.items.push(self) unless new_genre.items.include?(self)
  end

  def author=(new_author)
    @author = new_author
    new_author.items.push(self) unless new_author.items.include?(self)
  end

  def label=(new_label)
    @label = new_label
    new_label.items.push(self) unless new_label.items.include?(self)
  end

  def move_to_archive
    @archived = can_be_archived? if can_be_archived?
  end

  private

  def can_be_archived?
    (Time.now.year - @publish_date.year) > 10
  end
end
