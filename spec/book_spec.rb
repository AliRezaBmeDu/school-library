require 'spec_helper'

RSpec.describe Book do
  let(:book) { Book.new("Hamlet", "Shakespeare") }
  let(:person) { Person.new(20, "Harry") }

  describe "#initialize" do
    it "creates a new Book with title and author" do
      expect(book.title).to eq("Hamlet")
      expect(book.author).to eq("Shakespeare")
    end

    it "initializes rentals as an empty array" do
      expect(book.rentals).to be_an(Array)
      expect(book.rentals).to be_empty
    end
  end

  describe "#add_rental" do
    it "adds a rental to the rentals array" do
      rental = Rental.new('10/18/2023', book, person)
      book.add_rental(rental)
      expect(book.rentals).to include(rental)
    end
  end
end
