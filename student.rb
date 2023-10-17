require_relative 'person'

class Student < Person
  attr_accessor :classroom, :age, :name, :id
  attr_reader :label, :parent_permission

  def initialize(age, name = 'Unknown', parent_permission: true, id: nil)
    super(age, name, parent_permission: parent_permission, id: id)
    @classroom = nil
    @label = 'Student'
  end

  def assign_classroom(classroom)
    @classroom = classroom
    classroom.student_group.push(self) unless classroom.student_group.include?(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
