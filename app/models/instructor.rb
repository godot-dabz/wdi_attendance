class Instructor < User

  belongs_to :cohort
  has_many   :students, through: :cohort
  has_one    :producer, through: :cohort

  # has_secure_password
  def self.create_instructor_records()
  	employee_url = "http://104.131.73.180/api/v1/employees"
    employees = HTTParty.get(employee_url)
    @instructors = employees["employees"].select do |employee|
    	employee["role"] == "instructor"
        instructor = Instructor.new(name: employees[], email: employees[], cohort_id: cohort_id[])

    end
  end

    end # select
  end # self.create method

  def create_instructors
    employee_url = "http://104.131.73.180/api/v1/employees"
    employees = HTTParty.get(employee_url)

    instructors_hash = {}

    employees["employees"].each do |employee|
      if employee["role"] == "instructor"
        key = employee["id"]
        instructors_hash[key] = employee
      end
    end

    instructors_hash.each_pair do |id, instructor|
      Instructor.create(
        name:  instructor["data"]["first"] + " " + instructor["data"]["last"],
        email: instructor["contact"]["email"],
        cohort_id: instructor["cohort"],
        id: id,
        password: "12345"
      )
    end
  end


end # class
