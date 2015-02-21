class Producer < User
  has_many   :cohorts
  has_many   :instructors, through: :cohort

  # has_many   :students, through: :cohort
  # has_secure_password

  # def self.create_producer_records()
  # 	employee_url = "http://104.131.73.180/api/v1/employees"
  #   employees = HTTParty.get(employee_url)
  #   @instructors = employees["employees"].select do |employee|
  #   	employee["role"] == "producer"
  #       instructor = Instructor.new(name: employees["data"]["first"] + " " + employees["data"]["last"] ,
  #       	email: employees["contact"]["email"], cohort_id: cohort_id[""])
  #       instructor.save
  #     end
  # end
end

