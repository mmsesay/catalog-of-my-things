require_relative './book'
require_relative './music_album'
require_relative './genre'
require_relative './label'
require_relative './author'
require_relative './game'
require_relative '../modules/preserver_module'

class App
  include PreserverModule

  attr_reader :books, :labels

  def initialize
    @books = []
    @labels = []
    @authors = []
    @albums = []
    @genres = []
    @games = []

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
      'id' => new_label_instance.id,
      'title' => new_label_instance.title,
      'color' => new_label_instance.color
    }
    @labels << hash
  end

  def add_author(new_author)
    new_author_instance = Author.new(*new_author)
    hash = {
      'id' => new_author_instance.id,
      'first_name' => new_author_instance.first_name,
      'last_name' => new_author_instance.last_name
    }
    @authors << hash
  end

  def add_album(album_name, publish_date, genre_name, on_spotify)
    new_album_instance = MusicAlbum.new(on_spotify, album_name, publish_date)
    new_genre_instance = Genre.new(genre_name)
    new_album_instance.genre = new_genre_instance

    hash = {
      'album_name' => new_album_instance.name,
      'publish_date' => new_album_instance.publish_date,
      'on_spotify?' => new_album_instance.on_spotify,
      'genre' => new_genre_instance.name
    }

    genre_hash = {
      'genre_name' => new_genre_instance.name
    }

    @albums << hash
    @genres << genre_hash
  end

  def add_game(new_game)
    new_game_instance = Game.new(*new_game)
    hash = {
      'name' => new_game_instance.name,
      'publish_date' => new_game_instance.publish_date,
      'last_played_at' => new_game_instance.last_played_at,
      'multiplayer' => new_game_instance.multiplayer
    }
    @games << hash
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

  def list_all_authors
    puts "\nNote: No Author available." if @authors.empty?

    puts "\n----------------------------"
    puts "\nALL AUTHORS\n\n"
    puts "\nFirst Name \t| Last Name"
    puts '----------------------------'
    @authors.each do |author|
      puts "#{author['first_name'].to_s.strip} \t\t| #{author['last_name'].to_s.strip.rjust(3)}"
      puts "\n----------------------------"
    end
  end

  def list_all_labels
    puts "\nNote: No Label available." if @labels.empty?

    puts "\n-----------------------------------"
    puts "\nALL LABELS\n\n"
    puts "\nLabels \t\t| Color"
    puts '-----------------------------------'
    @labels.each do |label|
      puts "#{label['title'].to_s.strip} \t\t| #{label['color'].to_s.strip.rjust(2)}"
      puts "\n-----------------------------------"
    end
  end

  def list_all_albums
    puts "\nNote: No albums available." if @albums.empty?

    puts "\n----------------------------"
    puts "\nALL ALBUMS\n\n"
    puts "\Genre \t| On spotify? \t| Album Name \t| Publish Date"
    puts '-------------------------------------------------------'
    @albums.each do |album|
      puts "#{album['genre'].to_s.strip} \t| #{album['on_spotify?'].to_s.strip.rjust(10)} \t| #{album['album_name'].to_s.strip.rjust(10)} \t| #{album['publish_date'].to_s.strip.rjust(10)}"
      puts "\n---------------------------------------------------"
    end
  end

  def list_all_genres
    puts "\nNote: No genres available." if @genres.empty?

    puts "\n----------------------------"
    puts "\nALL GENRES\n\n"
    puts "\Name"
    puts '----------------------------'
    @genres.each do |genre|
      puts genre['genre_name'].to_s.strip
      puts "\n----------------------------"
    end
  end

  def list_all_games
    puts "\nNote: No Games available." if @games.empty?

    puts "\n---------------------------------------------"
    puts "\nALL GAMES\n\n"
    puts "\nName \t| Publish Date \t| Last Played \t| Multiplayer"
    puts '-------------------------------------------------'
    @games.each do |game|
      puts "#{game['name']} \t\t| #{game['publish_date']} \t| #{game['last_played_at']} \t| #{game['multiplayer']}"
      puts "\n-------------------------------------------------"
    end
  end

  def preserve_files
    save_data_as_json(@books, 'books')
    save_data_as_json(@authors, 'authors')
    save_data_as_json(@labels, 'labels')
    save_data_as_json(@albums, 'albums')
    save_data_as_json(@genres, 'genres')
    save_data_as_json(@games, 'games')
  end

  private

  def load_data
    @books = load_file('books')
    @labels = load_file('labels')
    @authors = load_file('authors')
    @albums = load_file('albums')
    @genres = load_file('genres')
    @games = load_file('games')
  end
end
