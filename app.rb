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

    def create_person
        puts "Enter the person's age: "
        age = gets.chomp.to_i
        puts "Enter the name of the person: "
        name = gets.chomp
        puts "Enter the parent permission [Y/N]"
        par_perm_input = gets.chomp.upcase
        parent_permission = (par_perm_input == 'Y')
        puts "parent_permission value is #{parent_permission}"
        puts "Is this person a Teacher or Student?"
        puts "S/s Student"
        puts "T/t Teacher"
        type = gets.chomp.upcase

        case type
        when "S"
            person = Student.new(age, name)
        when "T"
            puts "What is his/her specialization: "
            specialization = gets.chomp
            person = Teacher.new(age, specialization, name)
        else
            puts "Invalid person type"
            return
        end

        @people << person
        puts "person with name '#{person.name}' has been created with ID #{person.id}"
    end

    def create_book
        puts "Enter the book title: "
        title = gets.chomp.capitalize
        puts "Enter the name of the author: "
        author = gets.chomp.capitalize
        book = Book.new(title, author)
        puts "Book '#{book.title}' by '#{book.author}' is added to the list"
        @booklist << book
    end

end