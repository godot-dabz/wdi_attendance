class Cohort < ActiveRecord::Base
  has_many   :instructors
  has_many   :students
  belongs_to :producer
  # has_many   :attendances, through: :students


  # def self.create_cohort_records
  # 	cohort_url = "http://104.131.73.180/api/v1/cohorts"
  #   cohorts = HTTParty.get(cohort_url)
  #   cohorts["cohorts"].each do |cohort|
  #   	cohort = Cohort.new(
  #   		id: cohort["id"],
  #       name: cohort["name"],
  #       starts_on: cohort["dates"]["starts_on"],
  #       ends_on: cohort["dates"]["ends_on"],
  #       producer_id: cohort["producer_id"]
  #       )
  #     cohort.save
  #   end
  # end

  # def self.get_cohort
  #   cohort_url = "http://104.131.73.180/api/v1/cohorts"
  #   cohorts = HTTParty.get(cohort_url)
  #   cohorts["cohorts"].each do |cohort|
  #     # if cohort["producer_id"]
  #     new_cohort = Cohort.new(
  #       id: cohort["id"],
  #       name: cohort["name"],
  #       starts_on: cohort["dates"]["starts_on"],
  #       ends_on: cohort["dates"]["ends_on"],
  #       producer_id: cohort["producer_id"]
  #       )
  #     get_cohort_students(new_cohort.id)
  #     new_cohort.save
  #   end
  # end

  # This gets every student that is part of a specific cohort from the API and Creates them in our Database.
  def create_students
    students_url = "http://104.131.73.180/api/v1/cohorts/#{self.id}/students"
    students = HTTParty.get(students_url)
    students["students"].each do |student|
      new_student = Student.create(
        name: student["data"]["first"] + " " + student["data"]["last"],
        email: student["contact"]["email"],
        cohort_id: self.id,
        phone_number: student["contact"]["phone"],
        password: "12345"
        )
    end
  end

end




