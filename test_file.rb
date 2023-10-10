require_relative 'person'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'
require_relative 'classroom'
require_relative 'student'

classroom1 =  Classroom.new('Math Class')
classroom2 = Classroom.new('History Class')

student1 = Student.new(10, 'Dawid')
student2 = Student.new(12, 'Bairstow')
student3 = Student.new(18, 'Root')
student4 = Student.new(20, 'Brook')

classroom1.add_student(student2)
classroom1.add_student(student3)
classroom2.add_student(student1)
classroom2.add_student(student4)

# puts "#{student1.classroom}"
puts classroom2.student_list


