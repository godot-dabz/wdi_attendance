class Producer < User
  belongs_to :cohort
  has_many   :instructors, through: :cohort

  # has_many   :students, through: :cohort
  # has_secure_password
end

