class Instructor < User

  belongs_to :cohort
  has_many   :students, through: :cohort
  has_one    :producer, through: :cohort

  # has_secure_password

end
