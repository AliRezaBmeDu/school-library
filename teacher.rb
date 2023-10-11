require_relative 'person'

class Teacher < Person
  attr_reader :label
  
  def initialize(age, specialization, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
    @label = 'Teacher'
  end

  def can_use_services?
    true
  end
end
