class Cohort < ActiveRecord::Base

  has_many   :instructors
  has_many   :students
  belongs_to :producer


  # This gets every student that is part of a specific cohort from the API and Creates them in our Database.
  def create_students
    students_url = "http://104.131.73.180/api/v1/cohorts/#{self.id}/students"
    students = HTTParty.get(students_url)
    students["students"].each do |student|
      new_student = Student.create(
        id: student["id"],
        name: student["data"]["first"] + " " + student["data"]["last"],
        email: student["contact"]["email"],
        cohort_id: self.id,
        phone_number: student["contact"]["phone"],
        password: "12345"
        )
      Pony.mail(:to => new_student.email, :from => 'me@ga.co', :subject => 'New Account for GA Attendance created', :body => "Hello there, #{new_student.name}! We have created an account for you to track your attendance at GA. Your temporary password is 12345. Please log in soon to change it!")
    end
  end

  def create_instructors
    cohort_url = "http://104.131.73.180/api/v1/cohorts/#{self.id}"
    cohort = HTTParty.get(cohort_url)
    employee_url = "http://104.131.73.180/api/v1/employees"
    employees = HTTParty.get(employee_url)

    instructors_hash = {}

    instructors = cohort["cohorts"].first["instructor_ids"]

    employees["employees"].each do |employee|
      if employee["role"] == "instructor"
        key = employee["id"]
        instructors_hash[key] = employee
      end
    end

    cohort["cohorts"].first["instructor_ids"].each do |instructor_id|
      instructors_hash[instructor_id]["cohort"] = cohort["cohorts"].first["id"]
    end

    instructors_hash.each_pair do |id, instructor|
      if instructors.include? id
        new_instructor = Instructor.create(
          name:  instructor["data"]["first"] + " " + instructor["data"]["last"],
          email: instructor["contact"]["email"],
          cohort_id: instructor["cohort"],
          id: id,
          password: "12345"
        )
        Pony.mail(:to => new_instructor.email, :from => 'me@ga.co', :subject => 'New Account for GA Attendance created', :body => "Hello there, #{new_instructor.name}! We have created an account for you to track your students' attendance at GA. Your temporary password is 12345. Please log in soon to change it!")
      end
    end
  end

  def create_array_of_attendance
    cohort_attendance = []
    self.students.each { |s| cohort_attendance << s.attendances }
    cohort_attendance.flatten!
  end

  def calculate_total_unexcused_absence
    cohort_attendance = create_array_of_attendance
    absences = cohort_attendance.select do |attendance|
      attendance.absence_type == "Unexcused"
    end
    absences.count
  end

  def calculate_total_excused_absence
    cohort_attendance = create_array_of_attendance
    absences = cohort_attendance.select do |attendance|
      attendance.absence_type == "Excused"
    end
    absences.count
  end

  def calculate_total_lates
    cohort_attendance = create_array_of_attendance
    lates = cohort_attendance.select do |attendance|
      attendance.absence_type == "Late"
    end
    lates.count
  end



end




