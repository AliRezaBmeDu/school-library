require 'json'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'

module Storage
  def store_people
    data = []
    @people.each_with_index do |person, _index|
      person_json = {
        id: person.id,
        age: person.age,
        name: person.name,
        label: person.label
      }
      person_json['specialization'] = person.specialization if person.label == 'Teacher'
      data << person_json
    end
    open('./datastorage/people.json', 'w') { |f| f.write JSON.generate(data) }
  end
end
