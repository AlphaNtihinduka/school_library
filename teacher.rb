require './person'

# inherite Person class
class Teacher < Person
  attr_accessor :specialization, :parent_permission

  def initialize(name, age, specialization)
    @specialization = specialization
    super(age, name, parent_permission: true)
  end

  def can_use_services?
    true
  end
end
