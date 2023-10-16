require_relative 'app'
# require_relative 'storage'

TASKS = {
  1 => :list_books,
  2 => :list_people,
  3 => :create_person,
  4 => :create_book,
  5 => :create_rental,
  6 => :list_rental,
  default: :invalid_option
}.freeze

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
  # my_storage = Storage.new
  # my_storage.extract_data
  puts "Welcome to the 'School Library' app. Please make your choice and press Enter"
  loop do
    display_main_menu
    print 'input: '
    option = gets.chomp.to_i
    if option == 7
      puts 'Exiting... Thank you for using the application'
      break
    end
    selection = TASKS[option] || TASKS[:default]
    my_app.send(selection)
    puts "\n"
  end
  my_app.store_people
  my_app.store_books
end

main
