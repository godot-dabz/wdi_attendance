class Cohort < ActiveRecord::Base
  has_many :instructors
  has_many :students
end
