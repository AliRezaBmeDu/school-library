class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission = true)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @id = Random.rand(1..1000)
  end

  def can_use_services?
    of_age? || @parent_permission == true
  end

  private

  def of_age?
    true if age >= 18
  end
end
