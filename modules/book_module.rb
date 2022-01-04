module BookModule
  def capture_input(request_text)
    print "#{request_text}: "

    gets.chomp
  end

  def add_new_book_details
    puts "\n-------------------------------"
    puts "\nENTER BOOK DETAILS\n\n"

    publisher = capture_input('Input publisher name')
    publish_date = capture_input('Input publish date')
    cover_state = capture_input('Input cover state eg:(good or bad)')

    @app.add_book([publisher, publish_date, cover_state])
    puts "\nNew Book Added!"
    puts "\n-------------------------------"
  end
end
