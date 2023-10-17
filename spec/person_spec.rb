require 'spec_helper'

RSpec.describe Person do
  describe "#initialize" do
    it "creates a new Person with default values" do
      person = Person.new(25)
      expect(person.name).to eq('Unknown')
      expect(person.age).to eq(25)
      expect(person.parent_permission).to eq(true)
      expect(person.id).to be_between(1, 1000)
      expect(person.rentals).to be_an(Array)
      expect(person.rentals).to be_empty
    end

    it "creates a new Person with custom values" do
      person = Person.new(16, 'Mr. Frog', parent_permission: false, id: 123)
      expect(person.name).to eq('Mr. Frog')
      expect(person.age).to eq(16)
      expect(person.parent_permission).to eq(false)
      expect(person.id).to eq(123)
    end
  end

  describe "#can_use_services?" do
    it "returns true if the person is of age" do
      person = Person.new(20)
      expect(person.can_use_services?).to eq(true)
    end

    it "returns true if the person has parent permission" do
      person = Person.new(15)
      expect(person.can_use_services?).to eq(true)
    end

    it "returns false if the person is under 18 and has no parent permission" do
      person = Person.new(16, 'Mr. Bull', parent_permission: false)
      expect(person.can_use_services?).to eq(false)
    end
  end

  describe "#add_rental" do
    it "adds a rental to the rentals array" do
      person = Person.new(18)
      rental = double("Rental")
      person.add_rental(rental)
      expect(person.rentals).to include(rental)
    end
  end

  describe "#correct_name" do
    it "returns the person's name" do
      person = Person.new(30, 'Alice Johnson')
      expect(person.correct_name).to eq('Alice Johnson')
    end
  end
end
