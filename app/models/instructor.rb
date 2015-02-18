class Instructor < User
  belongs_to :cohort
  belongs_to :producer
end
