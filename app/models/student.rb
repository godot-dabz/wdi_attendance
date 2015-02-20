class Student < User

  belongs_to :cohort
  has_many   :instructors, through: :cohort
  has_many   :attendances
  has_secure_password

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



  def late?
    attendances.where(date: Date.today, absence_type: "Late").any?
  end

  def unexcused?
    attendances.where(date: Date.today, absence_type: "Unexcused").any?
  end
end
