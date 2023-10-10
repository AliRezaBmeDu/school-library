require_relative 'book'
require_relative 'person'
require_relative 'rental'

book1 = Book.new('Hamlet', 'Shakespeare')
book2 = Book.new('The Lord of the Rings', 'JRR Tolkein')

person1 = Person.new(25, 'Sam')
person2 = Person.new(28, 'Woakes')

rental1 = Rental.new('2-Oct', book1, person1)
rental2 = Rental.new('4-Oct', book1, person2)
rental3 = Rental.new('4-Oct', book2, person2)

puts "#{person1.name}'s rentals: "
person1.rentals.each { |rental| puts "#{rental.book.title} rented on #{rental.date}" }

puts "#{person2.name}'s rentals: "
person2.rentals.each { |rental| puts "#{rental.book.title} rented on #{rental.date}" }

puts "#{book2.title}'s rentals:"
book2.rentals.each { |rental| puts rental.person.name }

puts "#{book1.title}'s rentals:"
book1.rentals.each { |rental| puts rental.person.name }
