class Student < User

  belongs_to :cohort
  has_many   :attendances
  has_many   :instructors, through: :cohort
  # has_one    :producer, through: :cohort
  # has_secure_password

end
