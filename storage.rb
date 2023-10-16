require 'json'

class Storage
  attr_accessor :books_hash, :people_hash, :rentals_hash, :json_books, :json_people, :booklist, :people, :rentals

  def initialize(booklist, people, rentals)
    @booklist = booklist
    @people = people
    @rentals = rentals
    @books_hash = {}
    @people_hash = {}
    @rentals_hash = {}
  end

  def store_data
    @booklist.each_with_index do |book, index|
      @books_hash["book#{index}"] = book
    end

    @people.each_with_index do |person, index|
      @people_hash["person#{index}"] = person
    end

    @rentals.each_with_index do |rental, index|
      @rentals_hash["rental#{index}"] = rental
    end

    @json_books = @books_hash.to_json
    @json_people = @people_hash.to_json
    @json_rentals = @rentals_hash.to_json
    File.write('./datastorage/book.json', @json_books)
    File.write('./datastorage/people.json', @json_people)
    File.write('./datastorage/rental.json', @json_rentals)
  end

  def extract_data
    if File.exist?('./datastorage/book.json')
      file = File.read('./datastorage/book.json')
      data_hash = JSON.parse(file)
      @booklist = data_hash.values
    end
    if File.exist?('./datastorage/people.json')
      file = File.read('./datastorage/people.json')
      data_hash = JSON.parse(file)
      @people = data_hash.values
    end
    if File.exist?('./datastorage/rental.json')
      file = File.read('./datastorage/rental.json')
      data_hash = JSON.parse(file)
      @rentals = data_hash.values
    end
    
    puts @booklist
    puts @people
    puts @rentals
    return [@booklist, @people, @rentals]
  end
end
