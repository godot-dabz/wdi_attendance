class Instructor < User
  has_one :class
  has_one :producer
end
