require './person'

# inherite Person class
class Student < Person
  attr_accessor :classroom

  def initialize(classroom)
    @classroom = classroom
    super(name, age, parent_permission: true)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
