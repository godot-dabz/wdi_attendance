class Student < User

  belongs_to :cohort
  has_many   :instructors, through: :cohort
  has_many   :attendances
  # has_secure_password

  def late?
    attendances.where(date: Date.today, absence_type: "Late").any?
  end

  def unexcused?
    attendances.where(date: Date.today, absence_type: "Unexcused").any?
  end
end
