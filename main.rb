require_relative 'app'
require_relative 'storage'

def main
  my_app = App.new
  my_storage = Storage.new
  puts "Welcome to the 'School Library' app. Please make your choice and press Enter"
  my_storage.extract_data

  loop do
    my_app.display_main_menu
    choice = gets.chomp.to_i
    my_app.handle_choice(choice)
    break if choice == 7
  end
end

main
