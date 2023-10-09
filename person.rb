class Person
    attr_accessor :name
    attr_accessor :age
    attr_reader :id
    
    def initialize(name="Unknown", age, parent_permission="no")
        @name = name
        @age = age
        @parent_permission = parent_permission
        @id = Random.rand(1..1000)
    end
    
    def can_use_services?
        of_age? || parent_permission == "yes"
    end

    private

    def of_age?
        return true if age >= 18
    end
end