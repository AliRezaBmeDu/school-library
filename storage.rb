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
        personId: rental.person.id,
        bookTitle: rental.book.title
      }
      rental_data << rental_json
    end
    open('./datastorage/rental.json', 'w') { |f| f << JSON.generate(rental_data) }
  end

  def load_data_startup
    books, people, rentals = [], [], []
    book_file = './datastorage/books.json'
    people_file = './datastorage/people.json'
    rental_file = './datastorage/rental.json'
    if File.exist? book_file
      json_file = File.read(book_file)
      json_books = JSON.parse(json_file)
      json_books.each do |bookItem|
        books.push(Book.new(bookItem['title'], bookItem['author']))
      end
    end
    if File.exist? people_file
      json_file = File.read(people_file)
      json_people = JSON.parse(json_file)
      json_people.each do |person|
        people.push(Teacher.new(person['age'], person['specialization'], person['name'], id: person['id'])) if person['label'] == 'Teacher'
        people.push(Student.new(person['age'], person['name'], parent_permission: person['parent_permission'], id: person['id'])) if person['label'] == 'Student'
      end
    end
    if File.exist? rental_file
      json_rental = JSON.parse(File.read(rental_file))
      json_rental.each do |rental|
        person = people.find { |person| person.id == rental.personId }
        book = books.find { |book| book.title == rental.bookTitle }
        rentals.push(Rental.new(rental.date, book, person))
      end
    end
    return [books, people, rentals]
  end
end
