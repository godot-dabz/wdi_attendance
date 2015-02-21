class Instructor < User

  belongs_to :cohort
  belongs_to :producer

  # has_secure_password

end
