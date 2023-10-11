require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'

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
    print "Age: "
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp.capitalize

    [age, name, type]
  end

  def create_person
    age, name, type = create_person_inputs
    case type
    when 'Student'
      person = Student.new(age, name)
    when 'Teacher'
      print 'Specialization: '
      specialization = gets.chomp
      person = Teacher.new(age, specialization, name)
    else
      puts 'Invalid person type'
      return
    end

    @people << person
    puts "Person created successfully"
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
    puts "Rental created successfully"
  end

  def rental_list
    puts 'Enter the person ID: '
    id = gets.chomp.to_i
    person = @people.find { |p| p.id == id }
    if person.nil?
      puts 'The person is not in the list. Please press 2 and check the id of the people'
      return
    end
    puts "The books '#{person.name}' rented are: "
    # puts "#{person.rentals}"
    person.rentals.each do |rental|
      puts "Book '#{rental.book.title}' written by '#{rental.book.author}' was rented on #{rental.date}"
    end
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
      puts 'Invalid choice in section 1. Please enter a valid option'
    end
  end

  def handle_choice_section2(choice)
    case choice
    when 5
      create_rental
    when 6
      rental_list
    when 7
      puts 'Exiting... Thank you for using the app'
    else
      puts 'Invalid choice in section 2. Please enter a valid option'
    end
  end
end
