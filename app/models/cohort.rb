class Cohort < ActiveRecord::Base
  has_many   :instructors
  has_many   :students
  belongs_to :producer
  # has_many   :attendances, through: :students
end
