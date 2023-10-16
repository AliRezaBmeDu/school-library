require 'json'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'

module Storage
  def store_people
    data = []
    @people.each_with_index do |person, index|
      person_json = case person
        when Teacher
          {
            label: 'Teacher', 
            id: person.id, 
            age: person.age, 
            name: person.name,
            specialization: person.specialization
          }
        when Student
          {
            label: 'Student', 
            id: person.id, 
            age: person.age, 
            name: person.name
          }
        else
          puts "Unknown person type"
          {}
      end

      data << person_json
    end
    open('./datastorage/people.json', 'w') { |f| f.write JSON.generate(data) }
  end
end
