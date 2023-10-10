require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = nil
  end

  def assign_classroom(classroom)
    @classroom = classroom
    classroom.student_group.push(self) unless classroom.student_group.include?(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
