require_relative 'nameable'

class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id, :parent_permission

  def initialize(age, name = 'Unknown', parent_permission: true, id: nil)
    super()
    @name = name
    @age = age
    @parent_permission = parent_permission
    @id = id
    @id = Random.rand(1..1000) if @id.nil?
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    name
  end

  def add_rental(rental)
    @rentals << rental
  end

  private

  def of_age?
    age >= 18
  end
end
