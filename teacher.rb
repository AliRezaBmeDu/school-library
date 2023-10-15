require_relative 'person'

class Teacher < Person
  attr_reader :label

  def initialize(age, specialization, name = 'Unknown')
    super(age, name)
    @specialization = specialization
    @label = 'Teacher'
  end

  def can_use_services?
    true
  end
end
