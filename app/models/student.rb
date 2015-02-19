class Student < User

  belongs_to :cohort
  has_many   :instructors, through: :cohort
  belongs_to :attendance
  # has_secure_password

end
