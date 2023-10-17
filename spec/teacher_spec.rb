require 'spec_helper'

RSpec.describe Teacher do
  describe "#initialize" do
    it "creates a new Teacher with default values" do
      teacher = Teacher.new(35, 'Math')
      expect(teacher.name).to eq('Unknown')
      expect(teacher.age).to eq(35)
      expect(teacher.specialization).to eq('Math')
      expect(teacher.id).to be_a(Integer)
      expect(teacher.label).to eq('Teacher')
    end

    it "creates a new Teacher with custom values" do
      teacher = Teacher.new(40, 'Science', 'Mr. Frog', id: 123)
      expect(teacher.name).to eq('Mr. Frog')
      expect(teacher.age).to eq(40)
      expect(teacher.specialization).to eq('Science')
      expect(teacher.id).to eq(123)
    end
  end

  describe "#can_use_services?" do
    it "returns true for teachers (always allowed)" do
      teacher = Teacher.new(35, 'English')
      expect(teacher.can_use_services?).to eq(true)
    end
  end
end
