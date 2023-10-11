require_relative 'app'

def display_main_menu
  puts "\nMain Menu: "
  puts '1. List all books'
  puts '2. List all people'
  puts '3. Create a person'
  puts '4. Create a book'
  puts '5. Rent a book'
  puts '6. List the rentals for a person'
  puts '7. Exit'
end

def main
  my_app = App.new
  puts "Welcome to the 'School Library' app. Please make your choice and press Enter"
  loop do
    display_main_menu

    choice = gets.chomp.to_i

    case choice
    when 1
      my_app.list_books

    when 2
      my_app.list_people

    when 3
      my_app.create_person

    when 4
      my_app.create_book

    when 5
      my_app.create_rental

    when 6
      my_app.rental_list

    when 7
      puts 'Exiting... Thank you for using the app'
      break
    else
      puts 'Invalid choce. Please enter a valid option'
    end
  end
end

main
