module GameDataCollection
  def get_input(text)
    print "#{text}: "
    gets.chomp
  end

  def add_new_game_interractively
    puts "\n-------------------------------"
    puts "\nENTER GAME DETAILS\n\n"

    game_name = capture_input('Enter game name')
    publish_date = capture_input('Enter publish date')
    last_played = capture_input('Enter date last played')
    multiplayer = capture_input('Can more than one person play this game? (Enter T for True OR F for False')

    @app.add_game([game_name, publish_date, last_played, (multiplayer[0].downcase == 't')])
    puts "\nNew game successfully added!"
    puts "\n-------------------------------"
  end
end
