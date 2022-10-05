require './person'

# inherite Person class
class Student < Person
  attr_accessor :classroom
  attr_reader :classroom_student

  def initialize(classroom, age, name, _parent_permission)
    @classroom = classroom
    super(age, name, parent_permission: true)
  end

  def classroom_student=(classroom_student)
    @classroom_student = classroom_student
    classroom_student.students.push(self) unless classroom_student.students.include?(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
