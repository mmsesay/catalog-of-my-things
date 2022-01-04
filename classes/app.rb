$LOAD_PATH << '.'
require './classes/book'
require './classes/label'

class App
  attr_reader :books, :labels

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
    new_label_instance = Label.new(*new_label)
    hash = {
      'title' => new_label_instance.title,
      'color' => new_label_instance.color
    }
    @labels << hash
  end

  def list_all_books
    puts "\nNote: No Books available." if @books.empty?

    @books.each do |book|
      puts book
      puts "\n---------------------------------------------"
      puts "\nALL BOOKS\n\n"
      puts "\nPublisher \t| Publish Date \t| Cover State"
      puts '-----------------------------------------------'
      # puts "#{book.publisher} \t\t| #{book.publish_date} \t| #{book.cover_state}"
      puts "#{book['publisher']} \t\t| #{book['publish_date']} \t| #{book['cover_state']}"
      puts "\n---------------------------------------------"
    end
  end

  def list_all_labels
    puts "\nNote: No Label available." if @labels.empty?

    @labels.each do |label|
      puts label
      puts "\n-----------------------"
      puts "\nALL LABELS\n\n"
      puts "\nLabel \t| Color"
      puts '-------------------------'
      puts "#{label['title']} \t| #{label['color']}"
      puts "\n-----------------------"
    end
  end
end
