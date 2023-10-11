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
    puts "Enter the person's age: "
    age = gets.chomp.to_i
    puts 'Enter the name of the person: '
    name = gets.chomp.upcase
    puts 'Enter the parent permission [Y/N]'
    par_perm_input = gets.chomp.upcase
    parent_permission = (par_perm_input == 'Y')
    puts "parent_permission value is #{parent_permission}"
    puts 'Is this person a Teacher or Student?'
    puts 'S/s Student'
    puts 'T/t Teacher'
    type = gets.chomp.upcase

    [age, name, type]
  end

  def create_person
    age, name, type = create_person_inputs
    case type
    when 'S'
      person = Student.new(age, name)
    when 'T'
      puts 'What is his/her specialization: '
      specialization = gets.chomp
      person = Teacher.new(age, specialization, name)
    else
      puts 'Invalid person type'
      return
    end

    @people << person
    puts "person with name '#{person.name}' has been created with ID #{person.id}"
  end

  def create_book
    puts 'Enter the book title: '
    title = gets.chomp.upcase
    puts 'Enter the name of the author: '
    author = gets.chomp.upcase
    book = Book.new(title, author)
    puts "Book '#{book.title}' by '#{book.author}' is added to the list"
    @booklist << book
  end

  def list_books
    puts 'List of Books: '
    @booklist.each do |book|
      puts " '#{book.title}' written by '#{book.author}' "
    end
  end

  def list_people
    puts 'List of People:'
    @people.each do |person|
      puts "id: #{person.id}, name: #{person.name}, age: #{person.age}"
    end
  end

  def create_rental
    puts 'Enter the name of the person'
    name = gets.chomp.upcase
    person = @people.find { |p| p.name == name }

    if person.nil?
      puts "#{name} is not in the list"
      return
    end

    puts 'Enter the name of the book being rented: '
    book_name = gets.chomp.upcase
    book = @booklist.find { |b| b.title == book_name }

    if book.nil?
      puts "#{book_name} is not in the booklist"
      return
    end
    date = Time.now
    rental = Rental.new(date, book, person)
    @rentals << rental
    puts "#{name} rented #{book_name} at #{date}"
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
end
