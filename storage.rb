require 'json'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'

module Storage
  def store_people
    people_data = []
    @people.each_with_index do |person, _index|
      person_json = {
        id: person.id,
        age: person.age,
        name: person.name,
        label: person.label
      }
      person_json['specialization'] = person.specialization if person.label == 'Teacher'
      people_data << person_json
    end
    open('./datastorage/people.json', 'w') { |f| f.write JSON.generate(people_data) }
  end
end
