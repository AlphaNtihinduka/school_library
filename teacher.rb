require './person'

# inherite Person class
class Teacher < Person
  attr_accessor :specialization

  def initialize(specialization, age, name, _parent_permission)
    @specialization = specialization
    super(age, name, parent_permission: true)
  end

  def can_use_services?
    true
  end
end
