require_relative 'nameable'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(id, age, name = 'Unknown', parent_permission: true)
    super()
    @name = name
    @age = age
    @parent_permission = parent_permission
    @id = id
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    return name
  end

  private

  def of_age?
    true if age >= 18
  end

end
