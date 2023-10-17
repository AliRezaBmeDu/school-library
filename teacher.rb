require_relative 'person'

class Teacher < Person
  attr_reader :label
  attr_accessor :age, :name, :specialization, :id

  def initialize(age, specialization, name = 'Unknown', id: nil)
    super(age, name, id: id)
    @specialization = specialization
    @label = 'Teacher'
  end

  def can_use_services?
    true
  end
end
