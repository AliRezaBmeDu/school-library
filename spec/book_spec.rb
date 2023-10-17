require 'spec_helper'

RSpec.describe Book do
  let(:book) { Book.new("Hamlet", "Shakespeare") }

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
      rental = double("Rental")
      book.add_rental(rental)
      expect(book.rentals).to include(rental)
    end
  end
end
