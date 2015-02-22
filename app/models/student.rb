class Student < User

  belongs_to :cohort
  has_many   :attendances
  has_many   :instructors, through: :cohort
  has_one    :producer, through: :cohort

  has_secure_password

  attr_accessor :flash_notice

  def self.create_student_records_for_cohort(cohort_id)
  	students_url = "http://104.131.73.180/api/v1/cohorts/#{cohort_id}/students"
		students = HTTParty.get(students_url)
		# binding.pry
		@students = students["students"].map do |student|
			 student = Student.new(name:  student["data"]["first"] + " " + student["data"]["last"],
			 	email: student["contact"]["email"],
			 	password: "abcd")
			 student.save
		end
  end



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

    def late_more_than_four_times?
    lateness = self.attendances.select do |attendance|
      attendance.absence_type == "Late"
    end
    lateness.count >= 3
  end

  def delete_latenesses
    lateness = self.attendances.select do |attendance|
      attendance.absence_type == "Late"
    end
    lateness.each do |late|
      Attendance.delete(late.id)
    end
  end

  def converting_four_lates_into_one_absence
    delete_latenesses
    attendance = Attendance.new(
      absence_type: "Unexcused",
      student_id: self.id,
      date: Date.today
    )
  end


end
