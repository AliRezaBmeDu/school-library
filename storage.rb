require 'json'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'

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
end
