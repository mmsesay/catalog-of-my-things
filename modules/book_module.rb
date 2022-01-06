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

    add_new_author_details # request for author details
  end

  def add_new_author_details
    puts "\n-------------------------------"
    puts "\nENTER AUTHOR DETAILS\n\n"

    first_name = capture_input('Input First Name')
    last_name = capture_input('Input Last Name')

    @app.add_author([first_name, last_name])
    puts "\nNew Author Added!"
    puts "\n-------------------------------"

    add_new_label_details # request for label details
  end

  def add_new_label_details
    puts "\n-------------------------------"
    puts "\nENTER LABEL DETAILS\n\n"

    title = capture_input('Input label title')
    color = capture_input('Input label color')

    @app.add_label([title, color])
    puts "\nNew Label Added!"
    puts "\n-------------------------------"
  end
end
