require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'storage'

class App
  include Storage
  def initialize
    load_data_startup
  end

  def store_all_data
    store_people
    store_books
    store_rentals
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
    return unless @booklist

    @booklist.each do |book|
      puts "Title: \"#{book.title}\", Author: #{book.author}"
    end
  end

  def list_people
    puts 'List of People:'
    return unless @people

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
    current_time = Time.now
    date = current_time.strftime('%Y/%m/%d')
    rental = Rental.new(date, book, person)
    @rentals << rental
    puts "Date: #{date}"
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
      puts "Date: #{rental.date}, Book '#{rental.book.title}' by #{rental.book.author}"
    end
  end

  def invalid_option
    puts 'Invalid option'
  end
end
