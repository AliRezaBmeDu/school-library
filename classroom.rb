class Classroom
  attr_accessor :label, :student_group

  def initialize(label)
    @label = label
    @student_group = [] # this will contain the students
  end

  def add_student(student)
    @student_group << student # This will add a student objecgt to the students
    student.classroom = self
  end

  def student_list
    @student_group.each do |student|
      puts "id: #{student.id}, age: #{student.age}"
    end
  end
end
