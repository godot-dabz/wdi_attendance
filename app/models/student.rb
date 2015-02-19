class Student < User

  belongs_to :cohort
  has_many   :instructors, through: :cohort
  # has_secure_password

end
