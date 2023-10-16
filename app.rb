require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require 'json'

class App
  def initialize
    @booklist = []
    @rentals = []
    @people = []
  end

  def create_person_inputs
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    type_num = gets.chomp.to_i
    if type_num == 1
      type = 'Student'
    elsif type_num == 2
      type = 'Teacher'
    else
      puts 'Invalid option'
      return
    end
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp.capitalize

    [age, name, type]
  end

  def create_person
    age, name, type = create_person_inputs
    case type
    when 'Student'
      print 'Has parent permission [Y/N]: '
      parent_permission_input = gets.chomp.upcase
      parent_permission = (parent_permission_input == 'Y')
      person = Student.new(age, name, parent_permission: parent_permission)
    when 'Teacher'
      print 'Specialization: '
      specialization = gets.chomp
      person = Teacher.new(age, specialization, name)
    else
      puts 'Invalid person type'
      return
    end

    @people << person
    puts 'Person created successfully'
  end

  def create_book
    puts 'Enter the book title: '
    title = gets.chomp.capitalize
    puts 'Enter the name of the author: '
    author = gets.chomp.capitalize
    book = Book.new(title, author)
    puts "Book '#{book.title}' by '#{book.author}' is added to the list"
    @booklist << book
  end

  def list_books
    puts 'List of Books: '
    @booklist.each do |book|
      puts "Title: \"#{book.title}\", Author: #{book.author}"
    end
  end

  def list_people
    puts 'List of People:'
    @people.each do |person|
      puts "[#{person.label}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @booklist.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
    end
    book_idx = gets.chomp.to_i
    book = @booklist[book_idx]
    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.label}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_idx = gets.chomp.to_i
    person = @people[person_idx]
    date = Time.now
    rental = Rental.new(date, book, person)
    @rentals << rental

    date_part = date.strftime('%Y/%m/%d')
    puts "Date: #{date_part}"
    puts 'Rental created successfully'
  end

  def rental_list
    puts 'ID of person: '
    id = gets.chomp.to_i
    person = @people.find { |p| p.id == id }
    if person.nil?
      puts 'The person is not in the list. Please press 2 and check the id of the people'
      return
    end
    puts 'Rentals: '
    person.rentals.each do |rental|
      puts "Date: #{rental.date.strftime('%Y/%m/%d')}, Book '#{rental.book.title}' by #{rental.book.author}"
    end
  end

  def store_data
    books_hash = {}
    people_hash = {}
    rentals_hash = {}

    @booklist.each_with_index do |book, index|
      books_hash["book#{index}"] = book
    end

    @people.each_with_index do |person, index|
      people_hash["person#{index}"] = person
    end
    
    @rentals.each_with_index do |rental, index|
      rentals_hash["rental#{index}"] = rental
    end

    json_books = books_hash.to_json
    json_people = people_hash.to_json
    json_rentals = rentals_hash.to_json
    File.open('./datastorage/book.json', 'w') do |file|
      file.write(json_books)
    end
    File.open('./datastorage/people.json', 'w') do |file|
      file.write(json_people)
    end
    File.open('./datastorage/rental.json', 'w') do |file|
      file.write(json_rentals)
    end
  end

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

  def handle_choice(choice)
    if choice <= 4
      handle_choice_section1(choice)
    else
      handle_choice_section2(choice)
    end
  end

  def handle_choice_section1(choice)
    case choice
    when 1
      list_books
    when 2
      list_people
    when 3
      create_person
    when 4
      create_book
    else
      puts 'Invalid choice. Please enter a valid option'
    end
  end

  def handle_choice_section2(choice)
    case choice
    when 5
      create_rental
    when 6
      rental_list
    when 7
      store_data
      puts 'Exiting... Thank you for using the app'
    else
      puts 'Invalid choice. Please enter a valid option'
    end
  end
end
