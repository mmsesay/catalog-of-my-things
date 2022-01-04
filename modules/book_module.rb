require './modules/preserver_module'

module BookModule
  include PreserverModule

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
    add_new_label_details
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

  def preserve_files
    save_data_as_json(@app.books, 'books')
    save_data_as_json(@app.labels, 'labels')
  end
end
