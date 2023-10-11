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
    my_app.handle_choice(choice)
    break if choice == 7
  end
end

main
