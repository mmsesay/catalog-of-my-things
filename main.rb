require './classes/app'
require './modules/book_module'

class Main
  include BookModule

  def initialize
    @app = App.new
  end

  def menu
    puts "\n"
    puts 'Please choose an option by entering a number:
    1  - List all books
    2  - List all music albums
    3  - List of games
    4  - List all genres
    5  - List all labels
    6  - List all authors
    7  - Add a book
    8  - Add a music album
    9  - Add a game
    10 - Exit'
  end

  def handle_menu_selection
    user_input = gets.chomp
    case user_input
    when '1'
      @app.list_all_books
    when '2'
      p 'TODO: all music albums method'
    when '3'
      p 'TODO: all games method'
    when '4'
      p 'TODO: all genre method'
    when '5'
      @app.list_all_labels
    when '6'
      p 'TODO: all authors method'
    when '7'
      add_new_book_details
    when '8'
      p 'TODO: add a music album'
    when '9'
      p 'TODO: add a game method'
    when '10'
      preserve_files
      puts 'Exiting the application...'
      sleep 2
      exit
    else
      puts "\nERROR: Invalid option. Please select a digit from (1-10)\n"
    end
  end

  def run
    user_input = nil

    puts 'Welcome to the catalog of my things'

    while user_input != '10'
      menu
      handle_menu_selection
    end
  end
end

Main.new.run
