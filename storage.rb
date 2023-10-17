require 'json'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

module Storage
  def store_people
    people_data = []
    @people.each_with_index do |person, _index|
      person_json = {
        id: person.id,
        age: person.age,
        name: person.name,
        label: person.label
      }
      person_json['specialization'] = person.specialization if person.label == 'Teacher'
      person_json['parent_permission'] = person.parent_permission if person.label == 'Student'
      people_data << person_json
    end
    open('./datastorage/people.json', 'w') { |f| f.write JSON.generate(people_data) }
  end

  def store_books
    book_data = []
    @booklist.each do |book|
      book_json = {
        title: book.title,
        author: book.author
      }
      book_data << book_json
    end
    open('./datastorage/books.json', 'w') { |f| f << JSON.generate(book_data) }
  end

  def store_rentals
    rental_data = []
    @rentals.each do |rental|
      rental_json = {
        date: rental.date,
        person_id: rental.person.id,
        bookTitle: rental.book.title
      }
      rental_data << rental_json
    end
    open('./datastorage/rental.json', 'w') { |f| f << JSON.generate(rental_data) }
  end

  def load_booklist
    booklist = []
    book_file = './datastorage/books.json'
    if File.exist? book_file
      json_file = File.read(book_file)
      json_books = JSON.parse(json_file)
      json_books.each do |book_item|
        booklist.push(Book.new(book_item['title'], book_item['author']))
      end
    end
    booklist
  end

  def load_people
    people = []
    people_file = './datastorage/people.json'
    if File.exist? people_file
      json_file = File.read(people_file)
      json_people = JSON.parse(json_file)
      json_people.each do |person|
        if person['label'] == 'Teacher'
          people.push(Teacher.new(person['age'], person['specialization'], person['name'],
                                  id: person['id']))
        end
        if person['label'] == 'Student'
          people.push(Student.new(person['age'], person['name'], parent_permission: person['parent_permission'],
                                                                 id: person['id']))
        end
      end
    end
    people
  end

  def load_rentals
    rentals = []
    rental_file = './datastorage/rental.json'
    if File.exist? rental_file
      json_rental = JSON.parse(File.read(rental_file))
      json_rental.each do |rental|
        person_rent = @people.find { |person| person.id == rental['person_id'] }
        rented_book = @booklist.find { |book| book.title == rental['bookTitle'] }
        rentals.push(Rental.new(rental['date'], rented_book, person_rent))
      end
    end
    rentals
  end

  def load_data_startup
    @booklist = load_booklist
    @people = load_people
    @rentals = load_rentals
  end
end
