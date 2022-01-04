class App
  def initialize
    # Add arrays later on
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
      p 'TODO: all books method'
    when '2'
      p 'TODO: all music albums method'
    when '3'
      p 'TODO: all games method'
    when '4'
      p 'TODO: all genre method'
    when '5'
      p 'TODO: all label method'
    when '6'
      p 'TODO: all authors method'
    when '7'
      p 'TODO: add a book method'
    when '8'
      p 'TODO: add a music album'
    when '9'
      p 'TODO: add a game method'
    when '10'
      puts 'Exiting the application...'
      sleep 2
      exit
    end
  end

  def run
    user_input = nil

    puts 'Welcome to the catalog of my things'

    while user_input != '7'
      menu
      handle_menu_selection
    end
  end
end

def main
  app = App.new
  app.run
end

main
