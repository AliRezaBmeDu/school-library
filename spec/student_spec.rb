require 'spec_helper'

RSpec.describe Student do
  describe "#initialize" do
    it "creates a new Student with default values" do
      student = Student.new(15)
      expect(student.name).to eq('Unknown')
      expect(student.age).to eq(15)
      expect(student.parent_permission).to eq(true)
      expect(student.id).to be_a(Integer)
      expect(student.classroom).to be_nil
      expect(student.label).to eq('Student')
    end

    it "creates a new Student with custom values" do
      student = Student.new(16, 'Harry', parent_permission: false, id: 123)
      expect(student.name).to eq('Harry')
      expect(student.age).to eq(16)
      expect(student.parent_permission).to eq(false)
      expect(student.id).to eq(123)
    end
  end

  describe "#assign_classroom" do
    it "assigns a classroom to the student" do
      student = Student.new(17, 'Gary')
      classroom = Classroom.new('Math')
      student.assign_classroom(classroom)
      expect(student.classroom).to eq(classroom)
      expect(classroom.student_group).to include(student)
    end
  end

  describe "#play_hooky" do
    it "returns '¯(ツ)/¯'" do
      student = Student.new(14, 'Bob')
      expect(student.play_hooky).to eq('¯(ツ)/¯')
    end
  end
end
