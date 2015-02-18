class Student < ActiveRecord::Base
  has_one :class
  has_many :instructors
end
