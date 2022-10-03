require './person'

# inherite Person class
class Student < Person
  attr_accessor :classroom

  def initialize(classroom, age, name, _parent_permission)
    @classroom = classroom
    super(age, name, parent_permission: true)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
