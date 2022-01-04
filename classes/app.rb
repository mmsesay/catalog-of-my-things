require './classes/book'

class App
  def initialize
    @books = []
    @labels = []
  end

  def add_book(new_book)
    new_book_instance = Book.new(*new_book)
    hash = {
      'publisher' => new_book_instance.publisher,
      'publish_date' => new_book_instance.publish_date,
      'cover_state' => new_book_instance.cover_state
    }
    @books << hash
  end

  def add_label(new_label)
    @labels << new_label
  end

  def list_all_books
    puts "\nNote: No Books available." if @books.empty?

    @books.each do |book|
      puts book
      puts "\n-------------------------------"
      puts "\nALL BOOKS\n\n"
      puts "\nPublisher \t| Cover State"
      puts '-------------------------------'
      puts "#{book['publisher']} \t\t| #{book['cover_state']}"
      puts "\n-------------------------------"
    end
  end
end
