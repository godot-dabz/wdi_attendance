class Instructor < User

  belongs_to :cohort
  belongs_to :producer

  # has_secure_password
  def self.create_instructor_records()
  	employee_url = "http://104.131.73.180/api/v1/employees"
    employees = HTTParty.get(employee_url)
    @instructors = employees["employees"].select do |employee| 
    	employee["role"] == "instructor"
        instructor = Instructor.new(name: employees[], email: employees[], cohort_id: cohort_id[])
      end
    end
  end
