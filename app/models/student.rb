class Student < User

  belongs_to :cohort
  has_many   :instructors, through: :cohort
  has_many   :attendances
  # has_secure_password

  def late_on?(date)
    attendances.where(date: date, absence_type: "Late").any?

  end

  def unexcused_on?(date)
    attendances.where(date: date, absence_type: "Unexcused").any?
  end

  def excused_on?(date)
    attendances.where(date: date, absence_type: "Excused").any?
  end

  def late?
    late_on?(Date.today)
  end

  def count_lateness
    self.attendances.where(absence_type: "Late").length
  end

  def count_unexcused
    self.attendances.where(absence_type: "Unexcused").length
  end

  def count_excused
    self.attendances.where(absence_type: "Excused").length
  end

  def total_absences
    self.attendances.count
  end

  def total_class_absences
    self.all.attendances.count
  end
end
