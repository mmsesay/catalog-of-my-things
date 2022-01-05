require './classes/book'
require './classes/label'
require './modules/preserver_module'

class App
  include PreserverModule

  attr_reader :books, :labels

  def initialize
    @books = []
    @labels = []

    load_data
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

    puts "\n---------------------------------------------"
    puts "\nALL BOOKS\n\n"
    puts "\nPublisher \t| Publish Date \t| Cover State"
    puts '-------------------------------------------------'
    @books.each do |book|
      puts "#{book['publisher']} \t\t| #{book['publish_date']} \t| #{book['cover_state']}"
      puts "\n-------------------------------------------------"
    end
  end

  def list_all_labels
    puts "\nNote: No Label available." if @labels.empty?

    puts "\n----------------------------"
    puts "\nALL LABELS\n\n"
    puts "\nLabels \t| Color"
    puts '----------------------------'
    @labels.each do |label|
      puts "#{label['title'].strip} \t| #{label['color']}"
      puts "\n----------------------------"
    end
  end

  def preserve_files
    save_data_as_json(@books, 'books')
    save_data_as_json(@labels, 'labels')
  end

  private

  def load_data
    @books = load_file('books')
    @labels = load_file('labels')
  end
end
