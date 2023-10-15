require_relative 'app'

def main
  my_app = App.new
  puts "Welcome to the 'School Library' app. Please make your choice and press Enter"

  loop do
    my_app.display_main_menu
    choice = gets.chomp.to_i
    my_app.handle_choice(choice)
    break if choice == 7
  end
end

main
