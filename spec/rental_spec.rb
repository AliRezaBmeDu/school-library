require 'spec_helper'

RSpec.describe Rental do
  let(:book) { Book.new("Hamlet", "Shakespeare") }
  let(:person) { Person.new(25, "Harry") }
  let(:date) { "10/18/2023" }
  let(:rental) { Rental.new(date, book, person) }

  describe "#initialize" do
    it "creates a new Rental with a date, book, and person" do
      expect(rental.date).to eq(date)
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
    end

    it "adds the rental to the person's rentals" do
      expect(person.rentals).to include(rental)
    end

    it "adds the rental to the book's rentals" do
      expect(book.rentals).to include(rental)
    end
  end
end
