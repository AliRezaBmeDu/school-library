require_relative 'student'
require_relative 'teacher'

student1 = Student.new(12, 'Griffindor', 'Harry', true)
student2 = Student.new(18, 'Slitherin', 'Malfoy', false)

teacher1 = Teacher.new(50, 'Defense', 'Lupin')
teacher2 = Teacher.new(60, 'Deception', 'Snape')

puts student1.name # should print Harry
puts student2.age # should print 18
puts student2.can_use_services? # should print true
# Change the second student's age
student2.age = 13
puts student2.age # should print 13
puts student2.can_use_services? # should print false

puts student1.can_use_services? # should print true
puts teacher1.can_use_services? # should print true
puts teacher2.age # should print 60
